import 'dart:convert';

import 'package:finalyear/api/globals.dart';
import 'package:finalyear/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyService extends StatefulWidget {
  const MyService({super.key});

  @override
  State<MyService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  Map services = {};
  List listServices = [];
  String userId = '';
  Future myServices() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("id")!;
    http.Response response;
    response =
        await http.get(Uri.parse(baseUrl + "flutter/services/view/${userId}"));
    setState(() {
      services = json.decode(response.body);
      listServices = services['cart'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myServices();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: services['cart'] == null
          ? const Center(child: Text("data loading.."))
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
                          Icons.home,
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
                    "My services",
                    style: TextStyle(fontSize: 22, color: Color(0xFF363f93)),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: width * 0.009, right: width * 0.009),
                        margin: EdgeInsets.symmetric(vertical: width * 0.01),
                        width: double.maxFinite,
                        height: height * 0.3,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image.network(
                                //   imageUrl + listServices[index]['picture'],
                                //   fit: BoxFit.cover,
                                //   height: height * 0.1,
                                //   width: width * 0.3,
                                // ),
                                Container(
                                  width: width * 0.3,
                                  height: height * 0.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(150),
                                      image: DecorationImage(
                                          image: NetworkImage(imageUrl +
                                              listServices[index]['picture']),
                                          fit: BoxFit.cover)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Contact:",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        Text(
                                          listServices[index]['phone_number']
                                              .toString(),
                                          style: GoogleFonts.lato(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: width * 0.45,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Service: ${listServices[index]['name']}",
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Description",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(listServices[index]['description']
                                    .toString()),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                        padding: const EdgeInsets.all(10)),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.warning,
                                      color: Colors.white,
                                      size: 8,
                                    ),
                                    label: const Text('Cancel..')),
                                ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF363f93),
                                        padding: const EdgeInsets.all(10)),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 8,
                                    ),
                                    label: const Text('more..'))
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: listServices == null ? 0 : listServices.length,
                  )
                ],
              ),
            ),
    );
  }
}
