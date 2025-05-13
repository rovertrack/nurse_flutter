import 'package:flutter/material.dart';

class Instantbooking extends StatefulWidget {
  const Instantbooking({super.key});

  @override
  State<Instantbooking> createState() => _InstantbookingState();
}

class _InstantbookingState extends State<Instantbooking> {
  List<String> services = [
    "Injection administration (IM/IV)",
    "Wound dressing",
    "IV/Drip setup",
    "Nebulization",
    "Catheter insertion/removal",
    "Vital signs check",
    "Emergency first aid (with SOS)",
  ];

  // Track selection state for each service
  List<bool> isSelectedList = [];

  @override
  void initState() {
    super.initState();
    isSelectedList = List<bool>.filled(services.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instant Booking',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  children:
                      services.asMap().entries.map((entry) {
                        int index = entry.key;
                        String service = entry.value;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelectedList[index] = !isSelectedList[index];
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 8.0,
                            ), // Add spacing
                            height: screenWidth * 0.095,
                            width: screenWidth * 0.85,
                            decoration: BoxDecoration(
                              color:
                                  isSelectedList[index]
                                      ? Colors.blue.withOpacity(
                                        0.2,
                                      ) // Highlight when selected
                                      : Colors
                                          .white, // Default background color
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                              border: Border.all(
                                color:
                                    isSelectedList[index]
                                        ? Colors
                                            .blue // Highlight border when selected
                                        : const Color.fromARGB(
                                          255,
                                          148,
                                          145,
                                          145,
                                        ), // Default border
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                service, // Use the service name dynamically
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color:
                                      isSelectedList[index]
                                          ? Colors
                                              .blue // Change text color when selected
                                          : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () => (),

            style: TextButton.styleFrom(
              minimumSize: Size(screenWidth * 0.80, 10),
              backgroundColor: Color.fromARGB(255, 51, 85, 206),
            ),
            child: Text("Continue", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 1),
        ],
      ),
    );
  }
}
