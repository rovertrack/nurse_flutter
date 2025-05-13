import 'package:first/components/Banners.dart';
import 'package:first/pages/services/instant_booking.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatelessWidget {
  const Services({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final List<Map<String, dynamic>> services = [
      {'icon': Icons.quickreply, 'text': 'Instant Booking'},
      {'icon': Icons.calendar_month, 'text': 'Long Term Booking'},
      // {'icon': Icons.health_and_safety_outlined, 'text': 'Caregiver Booking'},
    ];
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerCarousel(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(
                    "Services",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.065,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(20),
                    child: TextButton(
                      onPressed: () => {},
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF3E69FE),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ), // Adjust padding
                        minimumSize: Size(
                          screenWidth * 0.161,
                          screenWidth * 0.027,
                        ), // Set minimum size
                        textStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400, // Adjust font size
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "see all",
                            style: GoogleFonts.inter(
                              fontSize: screenWidth * 0.033,
                              color: Colors.white,
                            ),
                          ),

                          Icon(Icons.keyboard_arrow_right, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    services.map((service) {
                      return GestureDetector(
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Instantbooking(),
                              ),
                            ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: const Color.fromARGB(255, 72, 97, 129),
                              width: 1,
                            ),
                          ),
                          child: Card(
                            margin: EdgeInsets.all(3),
                            elevation: 0,
                            color: Color.fromARGB(255, 51, 85, 206),
                            child: SizedBox(
                              height: screenWidth * 0.37,
                              width: screenWidth * 0.34,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    service['icon'],
                                    size: screenWidth * 0.06,
                                  ), // Icon size scales with screen width
                                  SizedBox(height: 8),
                                  Text(
                                    service['text'],
                                    softWrap: true,
                                    style: GoogleFonts.poppins(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
