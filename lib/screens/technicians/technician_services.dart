import 'dart:convert';

import 'package:finalyear/api/globals.dart';
import 'package:finalyear/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class TechnicianServices extends StatefulWidget {
  final String technicianId;
  const TechnicianServices({super.key, required this.technicianId});

  @override
  State<TechnicianServices> createState() => _TechnicianServicesState();
}

class _TechnicianServicesState extends State<TechnicianServices> {
  Map technicianServices = {};
  List listOfTechnicianServices = [];

  Future getTechnicianServices() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "${baseUrl}flutter/technicians/services/${widget.technicianId}"));
    if (response.statusCode == 200) {
      setState(() {
        technicianServices = json.decode(response.body);
        listOfTechnicianServices = technicianServices['technicians'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTechnicianServices();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: technicianServices == null
          ? const Text("data loading..")
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
                  Text(
                    "${technicianServices['technician']} ",
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
                        height: height * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              imageUrl +
                                  listOfTechnicianServices[index]['picture'],
                              fit: BoxFit.cover,
                              height: height * 0.3,
                              width: width * 0.7,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Name:",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                Text(
                                  listOfTechnicianServices[index]['name']
                                      .toString(),
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
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
                                  listOfTechnicianServices[index]
                                          ['phone_number']
                                      .toString(),
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
                                Text(listOfTechnicianServices[index]
                                        ['description']
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
                                    onPressed: () {},
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
                                    onPressed: () {},
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
                    itemCount: listOfTechnicianServices == null
                        ? 0
                        : listOfTechnicianServices.length,
                  )
                ],
              ),
            ),
    );
  }
}
