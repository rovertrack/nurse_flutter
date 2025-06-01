import 'package:first/components/Banners.dart';
// import 'package:first/pages/services/instant_booking.dart';
import 'package:first/components/instant.dart';
import 'package:first/pages/Patient.dart';
import 'package:first/pages/checkout.dart';
import 'package:first/pages/services/longtermbooking.dart';
import 'package:first/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Services extends StatefulWidget {
  const Services({super.key});
  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  bool button = false;
  List<String> selectedItem = [];
  bool _isAnimating = false; // New state variable for animation

  // Use this function to navigate to the next page with a bottom-to-top transition
  void navigateWithSlideUp(BuildContext context, Widget nextPage) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 290),
        pageBuilder: (context, animation, secondaryAnimation) => nextPage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final offsetAnimation = Tween<Offset>(
            begin: Offset(0, 2), // Start from bottom
            end: Offset.zero, // End at normal position
          ).animate(animation);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final List<Map<String, dynamic>> services = [
      {'icon': Icons.calendar_month, 'text': 'Long Term Booking'},
      // {'icon': Icons.health_and_safety_outlined, 'text': 'Caregiver Booking'},
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(1.0),
        //   child: Container(
        //     height: 15,
        //     // color: const Color.fromARGB(255, 192, 10, 10),
        //     color: Colors.cyan,
        //   ),
        // ),
        leading: IconButton(
          onPressed: () => {},
          icon: Image.asset('assets/icons/pin.png', height: 23, width: 23),
        ),

        actionsPadding: EdgeInsets.all(10),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Image.asset(
                'assets/icons/notification1.png',
                height: 20,
                width: 20,
              ),
              onPressed: () => {},
            ),
          ),
          // CupertinoButton(child: Icon(Icons.person), onPressed: () => ()),
        ],
        // title: Text("Nurse mate", style: TextStyle(fontSize: 20)),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BannerCarousel(),
                Text(
                  "Services",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.050,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),

                Instantbooking(
                  onItemsSelected: (List<String> selectedItems) {
                    setState(() {
                      button = selectedItems.isNotEmpty;
                      selectedItem = selectedItems;
                    });
                  },
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 12,
                      runSpacing: 12,
                      children:
                          services.map((service) {
                            return GestureDetector(
                              onTap:
                                  () => (Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Longtermbooking(),
                                    ),
                                  )),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(19),
                                  ),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                      255,
                                      72,
                                      97,
                                      129,
                                    ),
                                    width: 1,
                                  ),
                                ),
                                child: Card(
                                  margin: EdgeInsets.all(3),
                                  elevation: 0,
                                  color: Color.fromARGB(255, 51, 85, 206),
                                  child: SizedBox(
                                    height: screenWidth * 0.26,
                                    width: screenWidth * 0.27,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          service['icon'],
                                          size: screenWidth * 0.06,
                                        ),
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
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible:
            button || _isAnimating, // _isAnimating is true while animating out
        maintainState: true,
        maintainAnimation: true,
        maintainSize: false, // Don't keep space when hidden
        child: AnimatedSlide(
          offset: button ? Offset(0, 0) : Offset(0, 1),
          duration:
              button ? Duration(milliseconds: 300) : Duration(milliseconds: 50),
          curve: Curves.easeInOut,
          onEnd: () {
            setState(() {
              _isAnimating = button; // Only keep visible if button is true
            });
          },
          child: AnimatedOpacity(
            opacity: button ? 1.0 : 0.0,
            duration:
                button
                    ? Duration(milliseconds: 400)
                    : Duration(milliseconds: 50),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey, width: 0.3)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${selectedItem.length} services selected",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          '1299',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: TextButton(
                        onPressed: () {
                          navigateWithSlideUp(context, Patient());
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(0, 40),
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                        ),
                        child: Text(
                          "Continue",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
