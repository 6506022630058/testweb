import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Page1"),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Page1",
                  style: TextStyle(fontSize: 55),
                ),
                TextField(
                    keyboardType: TextInputType.text,
                    controller: text1,
                    cursorColor: Colors.green,
                    cursorRadius: Radius.circular(20),
                    cursorWidth: 20,
                    maxLength: 4,
                    //obscureText: true, //type password
                    decoration: const InputDecoration(
                        icon: Icon(Icons.print),
                        hintText: "Enter upto 4 Char Max",
                        border: OutlineInputBorder()),
                    onChanged: (value) {
                      //print("Debug Nop9:" + value);
                    }),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: text2,
                  decoration: const InputDecoration(hintText: "Enter number"),
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      record_data();
                    },
                    child: const Text("บันทึกใน prefs")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("กลับไปหน้าหลัก")),
              ],
            ),
          ),
        ));
  }

  Future<void> record_data() async {
    print("Text = " + text1.text + "Text2 = " + text2.text);
    print("Record to SharedPreferences");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", text1.text);
    prefs.setInt("securekey", int.parse(text2.text));
    Navigator.pushNamed(context, "/Page2");
  }
}
