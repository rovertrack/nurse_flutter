import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

Future<List<String>> fetchfromserver() async {
  Box? box;
  try {
    box = await Hive.openBox("appcache");
  } catch (e) {
    // If box is corrupted, delete and recreate
    await Hive.deleteBoxFromDisk("appcache");
    box = await Hive.openBox("appcache");
  }
  final response = await http.get(
    Uri.parse("http://159.89.164.129:8000/api/services"),
  );
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    final List<String> serviceNames =
        data.map((item) => item['service_name'] as String).toList();
    await box.put('services', serviceNames);
    return serviceNames;
  } else {
    throw Exception('Failed to load services');
  }
}

Future<List<dynamic>> loadServices() async {
  Box? box;
  try {
    box = await Hive.openBox('appcache');
  } catch (e) {
    // If box is corrupted, delete and recreate
    await Hive.deleteBoxFromDisk('appcache');
    box = await Hive.openBox('appcache');
  }
  List<String>? cached = box.get('services')?.cast<String>();
  if (cached != null && cached.isNotEmpty) {
    // Fetch from server in background (don't await)
    fetchfromserver();
    return cached;
  } else {
    // If no cache, fetch from server and cache
    return await fetchfromserver();
  }
}

class Instantbooking extends StatefulWidget {
  const Instantbooking({super.key, required this.onItemsSelected});
  final Function(List<String>) onItemsSelected;

  @override
  State<Instantbooking> createState() => _InstantbookingState();
}

class _InstantbookingState extends State<Instantbooking> {
  bool isloading = true;
  List<String> services = [];
  //  = [
  //   "Injection administration (IM/IV)",
  //   "Wound dressing",
  //   "IV/Drip setup",
  //   "Nebulization",
  //   "Catheter insertion/removal",
  //   "Vital signs check",
  //   "Emergency first aid (with SOS)",
  // ];

  // Track selection state for each service
  List<bool> isSelectedList = [];

  @override
  void initState() {
    super.initState();
    loadServices().then((loaded) {
      setState(() {
        services = loaded as List<String>;
        isSelectedList = List<bool>.filled(services.length, false);
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (isloading) {
      return Center(child: CircularProgressIndicator());
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Wrap(
            spacing: 4,
            runSpacing: 10,
            children:
                services.asMap().entries.map((entry) {
                  int index = entry.key;
                  String service = entry.value;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelectedList[index] = !isSelectedList[index];
                        final selectedItems = [
                          for (int i = 0; i < services.length; i++)
                            if (isSelectedList[i]) services[i],
                        ];
                        widget.onItemsSelected(selectedItems);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2,
                      ),
                      height: screenWidth * 0.24,
                      width: screenWidth * 0.24,
                      child: AnimatedContainer(
                        duration: Duration(
                          milliseconds: 190,
                        ), // Animation duration
                        curve: Curves.easeIn, // Optional: animation curve
                        decoration: BoxDecoration(
                          color:
                              isSelectedList[index]
                                  ? Colors.cyan.withOpacity(0.2)
                                  : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              isSelectedList[index]
                                  ? Border.all(
                                    color: const Color.fromARGB(
                                      255,
                                      0,
                                      96,
                                      105,
                                    ),
                                    width: 0.8,
                                  )
                                  : null,
                          boxShadow:
                              isSelectedList[index]
                                  ? []
                                  : [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                        31,
                                        61,
                                        61,
                                        61,
                                      ),
                                      blurRadius: 13,
                                      spreadRadius: 0.9,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.medical_services_outlined),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                service,
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      isSelectedList[index]
                                          ? Colors.blue
                                          : Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
