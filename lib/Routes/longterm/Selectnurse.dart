import 'package:flutter/material.dart';

class Selectnurse extends StatefulWidget {
  const Selectnurse({super.key});

  @override
  State<Selectnurse> createState() => _SelectnurseState();
}

class _SelectnurseState extends State<Selectnurse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Select Nurse")));
  }
}
