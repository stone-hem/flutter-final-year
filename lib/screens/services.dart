// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:finalyear/api/get_client.dart';
import 'package:finalyear/api/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  Map service = {};
  List listOfServices = [];

  Future getServices() async {
    http.Response response;
    response = await http.get(Uri.parse("${baseUrl}flutter/services"));
    if (response.statusCode == 200) {
      setState(() {
        service = json.decode(response.body);
        listOfServices = service['services'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    getServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: service == null
          ? Text("data loading..")
          : SingleChildScrollView(
              padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
              child: Column(
                children: [
                   const Text(
              "Services Offered!",
              style: TextStyle(fontSize: 26, color: Color(0xFF363f93)),
            ),
            const Text(
              "Get Going!",
              style: TextStyle(fontSize: 26, color: Color(0xFF363f93)),
            ),
            SizedBox(
              height: height * 0.05,
            ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: width * 0.01, right: width * 0.01),
                            margin: EdgeInsets.symmetric(vertical: width*0.01),
                            width: width*0.7,
                            height: height*0.4 ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 173, 173, 189)
                        ),
                        child: Column(
                          children: [
                            Image.network(imageUrl+listOfServices[index]['picture'], fit: BoxFit.cover,height: height*0.3,),
                            Text(listOfServices[index]['name'].toString()),
                            Text(listOfServices[index]['description']
                                .toString()),
                            SizedBox(
                              height: height * 0.05,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount:
                        listOfServices == null ? 0 : listOfServices.length,
                  )
                ],
              ),
            ),
    );
  }
}
