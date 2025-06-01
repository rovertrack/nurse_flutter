import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"), centerTitle: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Material(
                      color: Colors.transparent,
                      shape: const CircleBorder(),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(55),
                        onTap: () {},

                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.blueGrey,
                          child: Icon(
                            Icons.person_2_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff1B7CA3),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 2),
                          ],
                        ),
                        child: Icon(Icons.edit, color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 39),
              Text(
                "Account",
                style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffE2E8F0)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 16,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit_outlined,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Edit Profile",
                                style: GoogleFonts.poppins(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.navigate_next_outlined,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.7,
                          color: Color(0xffE2E8F0),
                          height: 0,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 16,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.notifications,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Notifications",
                                style: GoogleFonts.poppins(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.navigate_next_outlined,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Divider(
                            thickness: 0.7,
                            color: Color(0xffE2E8F0),
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.settings,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Settings",
                                style: GoogleFonts.poppins(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.navigate_next_outlined,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.7,
                          color: Color(0xffE2E8F0),
                          height: 0,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.policy,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Terms and Conditions",
                                style: GoogleFonts.poppins(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.navigate_next_outlined,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Divider(
                            thickness: 0.7,
                            color: Color(0xffE2E8F0),
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Logout",
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next_outlined,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 252, 254),

                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          Icon(
                            Icons.message_outlined,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          Text(
                            "Customer Support",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO: Implement call now action
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 13),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.call_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "Call Now",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO: Implement live chat action
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,

                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                padding: EdgeInsets.symmetric(vertical: 13),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.chat_bubble_outline,
                                    weight: 18,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "Live Chat",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffFFABAB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Color(0xFFFF5757),
                            size: 20,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "Emergency Support",
                              style: GoogleFonts.poppins(
                                color: Color(0xFFFF5757),
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        " For medical emergencies, please contact our 24/7 emergency support line",
                        style: GoogleFonts.poppins(
                          color: Color(0xFFFF5757),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO: Implement emergency support action
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 1),
                                backgroundColor: Color(0xFFFF5757),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 13),
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.call_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "Call Emergency Support",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(13),
                  backgroundColor: Color(0xffF0FBFC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  side: BorderSide(color: Color(0xffE2E8F0), width: 0.5),
                ),

                onPressed: () => (),
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.logout, color: Color(0xFFFF5757)),
                    Text(
                      "Logout",
                      style: GoogleFonts.poppins(color: Color(0xFFFF5757)),
                    ),
                    Spacer(),
                    Icon(
                      Icons.navigate_next_outlined,
                      color: Color(0xFFFF5757),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
