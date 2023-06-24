import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class P2 extends StatefulWidget {
  const P2({super.key});

  @override
  State<P2> createState() => _P2State();
}

class _P2State extends State<P2> {
  String text1 = "N/A", text2 = "N/A";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          const Text("Result"),
          Text(text1),
          Text(text2),
          ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                setState(() {
                  text1 = prefs.getString("username")!;
                  text2 = "${prefs.getInt("securekey")!}";
                });
              },
              child: const Text("แสดงข้อมูลที่บันทึกไว้"))
        ])));
  }
}
