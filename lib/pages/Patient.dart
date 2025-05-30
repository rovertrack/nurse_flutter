import 'package:first/pages/checkout.dart';
import 'package:flutter/material.dart';

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => PatientState();
}

class PatientState extends State<Patient> {
  DateTime? _selectedDate;
  final TextEditingController _dobController = TextEditingController();
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
        title: Text(
          "Patient Info",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Patient Information",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "First Name",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 40,
                        child: TextField(
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
                                color: Colors.grey[400] ?? Colors.grey,
                                width: 0.5, // Thin border
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[500] ?? Colors.grey,
                                width: 0.5, // Thin border
                              ),
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
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 30,
                            ),
                            focusColor: const Color.fromARGB(255, 4, 139, 163),
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
                      SizedBox(height: 16),
                      Text(
                        "Gender",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Male',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text('Male'),
                          Radio<String>(
                            value: 'Female',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text('Female'),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Date of Birth",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: _dobController,
                          readOnly: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[500] ?? Colors.grey,
                                width: 0.5, // Thin border
                              ),
                            ),
                            hintText: "Select date",
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.cyan[700],
                            ), // Calendar icon
                          ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                _selectedDate = pickedDate;
                                _dobController.text =
                                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                              });
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Medical History (if any)",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
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
                            hintStyle: TextStyle(fontWeight: FontWeight.w300),
                            hintText:
                                "Please provide any relevant medical history",
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
                      Text(
                        "This helps us provide better care",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          "Upload Prescriptions or Medical Records",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
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

                        child: Text("Upload Documents"),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(6, 182, 212, 1.05),
                            ),
                          ),
                          onPressed:
                              () => (Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Checkout(),
                                ),
                              )),
                          child: Text(
                            "Book Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
