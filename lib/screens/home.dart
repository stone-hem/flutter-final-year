import 'package:finalyear/api/get_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Container(
        padding: EdgeInsets.only(left: width*0.1),
         height: height*1,
  width: double.infinity,
  decoration: const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("images/catoonbonet.jpeg"),
        fit: BoxFit.cover),
  ),
  child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            const Text(
              "Welcome To Home Page!",
              style: TextStyle(fontSize: 26, color: Color(0xFF363f93)),
            ),
            const Text(
              "Continue!",
              style: TextStyle(fontSize: 26, color: Color(0xFF363f93)),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF363f93),
                    padding: EdgeInsets.all(20)),
                onPressed: () async {
                  var response =
                      await BaseClient().services("flutter").catchError(() {});
                  if (response == null) return;
                  debugPrint("success: ${response.body}");
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                ),
                label: Text('Services')),
            SizedBox(
              height: height * 0.1,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF363f93),
                    padding: EdgeInsets.all(20)),
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                ),
                label: Text('Firms')),
            SizedBox(
              height: height * 0.1,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF363f93),
                    padding: EdgeInsets.all(20)),
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                ),
                label: Text('Technicians')),
          ],
        ),
      
      ),
    );
  }
}