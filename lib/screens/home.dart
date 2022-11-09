import 'package:finalyear/screens/technicians.dart';
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
      body:  SingleChildScrollView(
      
        child: Column(
          children: [
             SizedBox(
                height: height * 0.1,
              ),
              const Text(
                "Welcome To Home Page!",
                style: TextStyle(fontSize: 26, color: Color(0xFF363f93)),
              ),
             
           
              Container(

                height: 200,
                child: ListView(
                  
                  scrollDirection: Axis.horizontal,
                  children: [
                      Container(
                    width: 100,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(image: AssetImage(
                        'images/lms-units.jpeg'
                      ),
                      fit: BoxFit.cover
                      )
                    ),
                  ),
                 
                  ],
                ),
              ),
          ],
        ),
      ),
     
    );
  }
}
