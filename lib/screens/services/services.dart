// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:finalyear/api/globals.dart';
import 'package:finalyear/screens/home.dart';
import 'package:finalyear/screens/services/service_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  Map service = {};
  List listOfServices = [];
  String userId = '';

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

  Future orderService(String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("id")!;
    Map data = {"user_id": userId};
    var body = json.encode(data);
    var url = Uri.parse(baseUrl + 'flutter/services/store/$id');
    http.Response response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      successSnackBar((context), "Order placed successfully");
    } else {
      errorSnackBar((context), "An error occurred while placing the order");
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
          ? Container(
              child: Center(child: Text("data loading..")),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xFF363f93),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const Home()));
                        },
                      )
                    ],
                  ),
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
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: width * 0.01, right: width * 0.01),
                        margin: EdgeInsets.symmetric(vertical: width * 0.01),
                        width: width * 0.7,
                        height: height * 0.6,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              imageUrl + listOfServices[index]['picture'].toString(),
                              fit: BoxFit.cover,
                              height: height * 0.3,
                              width: width * 0.7,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Owner:",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                Text(
                                  listOfServices[index]['detail_name']
                                      .toString(),
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Service:",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                Text(
                                  listOfServices[index]['name'].toString(),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Description:",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(listOfServices[index]['description']
                                    .toString()),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF363f93),
                                        padding: const EdgeInsets.all(20)),
                                    onPressed: () {
                                      orderService(listOfServices[index]['id']
                                          .toString());
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                    label: const Text('Order')),
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF363f93),
                                        padding: const EdgeInsets.all(20)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ServiceDetail(
                                                    serviceId:
                                                        listOfServices[index]
                                                                ['id']
                                                            .toString(),
                                                  )));
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                    label: const Text('more..'))
                              ],
                            )
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
