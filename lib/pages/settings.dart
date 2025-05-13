import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('You have  pushed  button this many time'),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: const Text("Press Me"),
          ),
        ],
      ),
    );
  }
}
