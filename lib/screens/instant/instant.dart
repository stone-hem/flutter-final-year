import 'package:finalyear/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstantOrder extends StatefulWidget {
  const InstantOrder({super.key});

  @override
  State<InstantOrder> createState() => _InstantOrderState();
}

class _InstantOrderState extends State<InstantOrder> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  String? userId;
  Future<void> getDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userId = preferences.getString("id");
    });
  }
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(
            top: height * 0.05, left: width * 0.05, right: width * 0.05),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Home()));
                  },
                  icon: const Icon(Icons.home),
                  color: const Color(0xFF363f93),
                ),
                SizedBox(
                  width: width * 0.15,
                ),
                const Text(
                  "Services Instantly!",
                  style: TextStyle(fontSize: 20, color: Color(0xFF363f93)),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.1,
            ),
            TextField(
              controller: titleController,
              style: const TextStyle(color: Colors.black),
              cursorColor: const Color(0xFF9b9b9b),
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: const InputDecoration(
                  hintText: 'title',
                  hintStyle: TextStyle(
                    color: Color(0xFF9b9b9b),
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  )),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            TextField(
              controller: descController,
              style: const TextStyle(color: Colors.black),
              cursorColor: const Color(0xFF9b9b9b),
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: const InputDecoration(
                  hintText: 'brief desc',
                  hintStyle: TextStyle(
                    color: Color(0xFF9b9b9b),
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  )),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF363f93),
                    padding: EdgeInsets.symmetric(
                        horizontal: height * 0.02, vertical: width * 0.05)),
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  size: 10,
                ),
                label: const Text("Submit.."))
          ],
        ),
      )),
    );
  }
}
