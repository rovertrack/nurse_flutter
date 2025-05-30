import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _Checkout();
}

class _Checkout extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Booking Summary",
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(22, 78, 99, 2),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text(
              //   "Booking Summary",
              //   style: GoogleFonts.notoSans(
              //     fontSize: 23,
              //     fontWeight: FontWeight.w600,
              //     color: Color.fromRGBO(22, 78, 99, 2),
              //   ),
              // ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        "Review your appointment details and confirm your booking",
                        style: GoogleFonts.redHatDisplay(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(75, 85, 99, 2),
                        ),
                        textAlign: TextAlign.center,

                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 345,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromARGB(57, 105, 96, 96),
                    width: 0.5,
                  ),

                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 254, 255, 1),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Selected Services",
                                style: TextStyle(
                                  color: Colors.cyan[800],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.check, color: Colors.cyan[900]),
                                    SizedBox(
                                      width: 10,
                                    ), // Space between check and Iv
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "IV injection",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Duration :  45 minutes",
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(), // Pushes "799" to the end
                                    Text(
                                      "799",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(thickness: 0.8, color: Colors.grey[400]),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Total Duration :",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("45 minutes"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Instructions for  the  Nurse(optional)",
                        style: TextStyle(
                          color: Colors.cyan[800],

                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 3),
                      SizedBox(
                        height: 120, // Adjust height as needed
                        child: TextFormField(
                          maxLines: null, // Allows unlimited lines
                          minLines: 4, // Minimum visible lines
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[40],
                            ),
                            hintText: "Enter special instruction for the nurse",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[500] ?? Colors.grey,
                                width: 0.5, // Thin border
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),

              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromARGB(57, 105, 96, 96),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Booking Summary",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Space between check and Iv
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "IV injection",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "799",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Divider(thickness: 0.6, color: Colors.grey[350]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "799",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.cyan[700],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            width: constraints.maxWidth,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(236, 254, 255, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                "Payment will be collected after service completion",
                                style: TextStyle(
                                  color: Color.fromRGBO(22, 78, 99, 1),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: MaterialButton(
                          minWidth: 200,
                          onPressed: () {},
                          color: Color.fromRGBO(8, 145, 178, 1),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text("Confirm Booking"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
