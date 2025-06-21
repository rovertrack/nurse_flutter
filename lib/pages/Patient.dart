// import 'dart:ffi'; // Removed to avoid 'Size' name conflict

import 'package:first/pages/checkout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => PatientState();
}

class PatientState extends State<Patient> {
  DateTime? _selectedDate;
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _medicalHistoryController =
      TextEditingController();
  String? _selectedGender;

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Patient Information",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 223, 223, 223),
                  offset: Offset(0, 1.5),
                  blurRadius: 5,
                  spreadRadius: 0.038,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "First Name",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _firstNameController,
                      cursorHeight: 18,
                      cursorWidth: 2,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        focusColor: const Color.fromARGB(255, 19, 140, 161),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[300] ?? Colors.grey,
                            width: 0.5, // Thin border
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[300] ?? Colors.grey,
                            width: 0.5, // Thin border
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.cyan, // Border color when focused
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Last Name",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        focusColor: const Color.fromARGB(255, 4, 139, 163),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[300] ?? Colors.grey,
                            width: 0.5, // Thin border
                          ),

                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[300] ?? Colors.grey,
                            width: 0.5, // Thin border
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.cyan, // Border color when focused
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Gender",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          minimumSize: WidgetStatePropertyAll(Size(150, 45)),

                          backgroundColor: WidgetStatePropertyAll(
                            _selectedGender == "Male"
                                ? Colors.cyan
                                : Colors.transparent,
                          ),
                          foregroundColor: WidgetStatePropertyAll(
                            _selectedGender == "Male"
                                ? Colors.white
                                : Colors.cyan,
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              side: BorderSide(color: Colors.cyan, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        onPressed:
                            () => setState(() {
                              _selectedGender = "Male";
                            }),
                        child: Text(
                          "Male",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        style: ButtonStyle(
                          minimumSize: WidgetStatePropertyAll(Size(150, 45)),
                          backgroundColor: WidgetStatePropertyAll(
                            _selectedGender == "Female"
                                ? Colors.cyan
                                : Colors.transparent,
                          ),
                          foregroundColor: WidgetStatePropertyAll(
                            _selectedGender == "Female"
                                ? Colors.white
                                : Colors.cyan,
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              side: BorderSide(color: Colors.cyan, width: 1.5),

                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed:
                            () => setState(() {
                              _selectedGender = "Female";
                            }),
                        child: Text(
                          "Female",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Date of Birth",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: _dobController,
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 1.5, // Thin border
                          ),
                        ),

                        hintText: "Select date",
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.cyan, // Change to your desired color
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.cyan[700],
                        ), // Calendar icon
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,

                          initialDate: _selectedDate ?? DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.cyan,
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate = pickedDate;
                            _dobController.text =
                                "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Medical History (if any)",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 120, // Adjust height as needed
                    child: TextFormField(
                      controller: _medicalHistoryController,
                      maxLines: null, // Allows unlimited lines
                      minLines: 4, // Minimum visible lines
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                        ),
                        hintText: "Please provide any relevant medical history",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey[300] ?? Colors.grey,
                            width: 0.5, // Thin border
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "This helps us provide better care",
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Upload Prescriptions or Medical Records",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 12),
                  TextButton(
                    style: ButtonStyle(
                      side: WidgetStatePropertyAll(
                        BorderSide(
                          color: Colors.cyan, // Choose your border color
                          width: 1.5, // Border thickness
                        ),
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    onPressed: () => (),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.upload_file_outlined, color: Colors.cyan),
                        Text(
                          "Upload Documents",
                          style: GoogleFonts.poppins(
                            color: Colors.cyan,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.fromBorderSide(
            BorderSide(color: Colors.grey.shade200, width: 0.5),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Checkout()),
                );
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(0, 40),
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
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
        ),
      ),
    );
  }
}
