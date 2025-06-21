import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fquery/src/observer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:fquery/fquery.dart';

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
    try {
      final List<dynamic> data = json.decode(response.body);
      final List<String> serviceNames =
          data.map((item) => item['service_name'] as String).toList();
      await box.put('services', serviceNames);
      return serviceNames;
    } catch (e) {
      // If JSON is invalid, fall back to cache if available
      List<String>? cached = box.get('services')?.cast<String>();
      if (cached != null && cached.isNotEmpty) {
        return cached;
      } else {
        throw Exception(
          'Invalid data from server and no cache available: ' + e.toString(),
        );
      }
    }
  } else {
    List<String>? cached = box.get('services')?.cast<String>();
    if (cached != null && cached.isNotEmpty) {
      return cached;
    } else {
      throw Exception(
        'Failed to load services and no cache available: ${response.statusCode}',
      );
    }
  }
}

Future<List<String>> loadServices() async {
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

final servicesQueryFn = () => loadServices();

class Instantbooking extends StatefulWidget {
  const Instantbooking({super.key, required this.onItemsSelected});
  final Function(List<String>) onItemsSelected;

  @override
  State<Instantbooking> createState() => _InstantbookingState();
}

class _InstantbookingState extends State<Instantbooking> {
  List<bool> isSelectedList = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return QueryBuilder<List<String>, Object>(
      const ['services'],
      staleDuration: Duration(minutes: 1),
      refetchInterval: Duration(seconds: 10),
      servicesQueryFn,
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, color: Colors.red),
                SizedBox(height: 8),
                Text(
                  'Failed to load services',
                  style: TextStyle(color: Colors.red),
                ),
                Text(state.error.toString(), style: TextStyle(fontSize: 12)),
                SizedBox(height: 8),
                ElevatedButton(onPressed: state.refetch, child: Text('Retry')),
              ],
            ),
          );
        }
        final services = state.data ?? [];
        if (isSelectedList.length != services.length) {
          isSelectedList = List<bool>.filled(services.length, false);
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
                            duration: Duration(milliseconds: 190),
                            curve: Curves.easeIn,
                            decoration: BoxDecoration(
                              color:
                                  isSelectedList[index]
                                      ? Colors.cyan.withOpacity(0.2)
                                      : Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
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
                                            74,
                                            74,
                                            74,
                                          ),
                                          blurRadius: 11,
                                          spreadRadius: 0.7,
                                          offset: Offset(1, 2),
                                        ),
                                      ],
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.medical_services_outlined,
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        service + "           ",
                                        style: GoogleFonts.poppins(
                                          fontSize: 9.5,
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
                                Positioned(
                                  top: -2, // <-- try adjusting this for overlap
                                  right: -0.1,
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: Icon(Icons.add_outlined, size: 16),
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
      },
    );
  }
}
