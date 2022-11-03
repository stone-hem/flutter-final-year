import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../api/globals.dart';

class Firm extends StatefulWidget {
  const Firm({super.key});

  @override
  State<Firm> createState() => _FirmState();
}

class _FirmState extends State<Firm> {
   Map firm = {};
  List listOfFirms = [];

  Future getFirms() async {
    http.Response response;
    response = await http.get(Uri.parse("${baseUrl}flutter/firms"));
    if (response.statusCode == 200) {
      setState(() {
        firm = json.decode(response.body);
        listOfFirms = firm['firms'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    getFirms();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: firm == null
          ? Text("data loading..")
          : SingleChildScrollView(
              padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
              child: Column(
                children: [
                  const Text(
                    "Technicians Available!",
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
                        margin: EdgeInsets.symmetric(vertical: width * 0.01),
                        width: width * 0.7,
                        height: height * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              imageUrl + listOfFirms[index]['org_pic'],
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
                                  listOfFirms[index]['name']
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
                                  listOfFirms[index]['phone_number'].toString(),
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
                                 Text(listOfFirms[index]['description']
                                .toString()),
                              ],
                            ),
                           SizedBox(height: height*0.01,),
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
                                    label: const Text('Book')),
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
                                    label: const Text('View more'))
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    itemCount:
                        listOfFirms == null ? 0 : listOfFirms.length,
                  )
                ],
              ),
            ),
    );
  }
}