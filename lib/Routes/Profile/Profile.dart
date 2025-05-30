import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0.1),
          child: Divider(
            thickness: 0.2,
            color: const Color.fromARGB(255, 207, 207, 207),
          ),
        ),
      ),
      body: Padding(
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
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 207, 207, 207),
                    offset: Offset(-1, -1),
                    blurRadius: 5,
                    spreadRadius: -6,
                  ),
                ],
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 4,

                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.edit_note_outlined),
                            SizedBox(width: 4),
                            Text("Edit Profile"),
                            Spacer(),
                            Icon(Icons.navigate_next_outlined),
                          ],
                        ),
                        Divider(thickness: 0.7, color: Colors.grey[300]),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.notifications),
                            SizedBox(width: 4),
                            Text("Notifications"),
                            Spacer(),
                            Icon(Icons.navigate_next_outlined),
                          ],
                        ),
                        Divider(thickness: 0.7, color: Colors.grey[300]),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.settings),
                            SizedBox(width: 4),
                            Text("Settings"),
                            Spacer(),
                            Icon(Icons.navigate_next_outlined),
                          ],
                        ),
                        Divider(thickness: 0.7, color: Colors.grey[300]),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.policy),
                            SizedBox(width: 4),
                            Text("Terms and Conditions"),
                            Spacer(),
                            Icon(Icons.navigate_next_outlined),
                          ],
                        ),
                        Divider(thickness: 0.7, color: Colors.grey[300]),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.logout),
                            SizedBox(width: 4),
                            Text("Logout"),
                            Spacer(),
                            Icon(Icons.navigate_next_outlined),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(160, 171, 202, 255),
                  width: 0.3,
                ),
                color: const Color.fromARGB(255, 243, 254, 255),

                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.support_agent),
                        Text("Customer Support"),
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
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 3),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.call_outlined, color: Colors.white),
                                SizedBox(width: 4),
                                Text(
                                  "Call Now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
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
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.chat_bubble_outline,
                                  color: const Color.fromARGB(255, 68, 93, 255),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "Live Chat",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                      255,
                                      68,
                                      93,
                                      255,
                                    ),
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
            SizedBox(height: 18),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(
                  255,
                  255,
                  237,
                  237,
                ), // Light red background
                border: Border.all(
                  color: Color.fromARGB(255, 255, 102, 94), // Red border
                  width: 0.3,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: Color(0xFFFF3B30),
                          size: 20,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "Emergency Support",
                            style: TextStyle(
                              color: Color.fromARGB(204, 158, 36, 30),
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
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
                              backgroundColor: Color(0xFFFF3B30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 3,
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.call, color: Colors.white, size: 16),
                                SizedBox(width: 6),
                                Text(
                                  "Call Emergency Support",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
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
          ],
        ),
      ),
    );
  }
}
