import 'package:flutter/material.dart';

class ChooseTime extends StatelessWidget {
  const ChooseTime({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> times = ["within 1 hours", "within 2 hours"];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose Time within ",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Center(child: Image.asset("images/fast.png", height: 65, width: 65)),
          SizedBox(height: 10),
          Column(
            children:
                times.asMap().entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black12),
                      ),
                      child: Center(child: Text(entry.value)),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
