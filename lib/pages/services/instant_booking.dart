import 'package:first/pages/services/choose_time.dart';
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
                child: Wrap(
                  spacing: 10.0, // Horizontal spacing between cards
                  runSpacing: 10.0, // Vertical spacing between rows
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
                            height: screenWidth * 0.28,
                            width:
                                screenWidth *
                                0.40, // Adjust width for two cards per row
                            decoration: BoxDecoration(
                              color:
                                  isSelectedList[index]
                                      ? Colors.cyan.withOpacity(
                                        0.2,
                                      ) // Highlight when selected
                                      : Colors
                                          .white, // Default background color
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
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
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    service, // Use the service name dynamically
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color:
                                          isSelectedList[index]
                                              ? Colors
                                                  .blue // Change text color when selected
                                              : Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChooseTime()),
                ),
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
