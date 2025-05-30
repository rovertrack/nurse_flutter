import 'package:first/Routes/longterm/schedule.dart';
import 'package:flutter/material.dart';

class Longtermbooking extends StatelessWidget {
  Longtermbooking({super.key});
  final List<String> longtermservices = [
    'Elderly Care',
    'Post Surgery ecovery care',
    'post delivery & child care ',
    'post vital surgery care ',
    'Chronic illness management',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Long Term Booking",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: longtermservices.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap:
                      () => (
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) =>),
                        // )
                      ),
                  child: Column(
                    children: [
                      Icon(Icons.local_hospital_rounded, size: 100),
                      Spacer(),
                      Text(
                        longtermservices[index],
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
