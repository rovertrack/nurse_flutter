import 'package:first/Routes/longterm/schedule.dart';
import 'package:first/Routes/schedule.dart';
import 'package:first/pages/checkout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Longtermbooking extends StatelessWidget {
  Longtermbooking({super.key});
  final List<Map<String, String>> longtermservices = [
    {
      'title': 'Elderly Care',
      'description':
          'Specialized Care for seniors including medication management ,mobility assistance,and daily activities',
    },
    {
      'title': 'Post Surgery Recovery care',
      'description':
          'Professional care during recovery period including wound care and rehabilitaion exercises',
    },
    {
      'title': 'Post delivery & child care ',
      'description':
          'Comprehensive care for new mothers and infants including feeding support and recovery assistance ',
    },
    {
      'title': 'Post vital surgery care ',
      'description':
          'Intensive care after major surgeries with vital monitoring and medical assistance ',
    },
    {
      'title': "Chronic illness management",
      'description':
          'Ongoing care for chronic conditions including medication management and health montioring ',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Long Term Booking",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: longtermservices.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 20,
                  childAspectRatio: 3.1,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade50,
                          blurRadius: 5,
                          spreadRadius: 0.01,
                        ),
                      ],
                      border: Border.fromBorderSide(
                        BorderSide(color: Colors.grey.shade300, width: 0.5),
                      ),
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap:
                            () => (Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Schedule(),
                              ),
                            )),
                        child: Row(
                          spacing: 16,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.local_hospital_rounded,
                              size: 50,
                              color: Colors.cyan.shade500,
                            ),
                            Expanded(
                              child: Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    longtermservices[index]['title']!,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    longtermservices[index]['description']!,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.cyan.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.cyan.shade300,
                    ),
                    Expanded(
                      child: Text(
                        "our long-term care services are customized to your specific needs with qualified and experienced healthcare professionals ",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
