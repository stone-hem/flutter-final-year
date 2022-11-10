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
             
            SizedBox(
                height: height * 0.05,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child:Row(
                  mainAxisAlignment:  MainAxisAlignment.start,
                  children: [
                    Text("Discover")
                  ],
                ),
              ),

              SizedBox(
                height: 300,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                      Container(
                    width: width*0.8,
                    height: 300,
                    margin: EdgeInsets.only(right: width*0.05),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(image: AssetImage(
                        'images/service.jpg'
                      ),
                      fit: BoxFit.cover
                      )
                    ),
                  ),
                   Container(
                    width: width*0.8,
                    height: 200,
                     margin: EdgeInsets.only(right: width*0.05),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(image: AssetImage(
                        'images/technician1.jpg'
                      ),
                      fit: BoxFit.cover
                      )
                    ),
                  ),
                   Container(
                    width: width*0.8,
                    height: 200,
                     margin: EdgeInsets.only(right: width*0.05),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(image: AssetImage(
                        'images/firm1.jpg'
                      ),
                      fit: BoxFit.cover
                      )
                    ),
                  ),
                  ],
                ),
              ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width*0.05),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Explore More"),
                    Text("see all")
                  ],
                ),
            )


          ],
        ),
      ),
     
    );
  }
}
