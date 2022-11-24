import 'dart:convert';

import 'package:finalyear/api/globals.dart';
import 'package:finalyear/screens/home.dart';
import 'package:finalyear/screens/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TechnicianDetail extends StatefulWidget {
  String technicianId;
  TechnicianDetail({super.key, required this.technicianId});

  @override
  State<TechnicianDetail> createState() => _TechnicianDetailState();
}

class _TechnicianDetailState extends State<TechnicianDetail> {
  Map technicianDetails = {};
  Future getTechnicianDetails() async {
    http.Response response;
    response = await http
        .get(Uri.parse("${baseUrl}flutter/technicians/${widget.technicianId}"));
    if (response.statusCode == 200) {
      setState(() {
        technicianDetails = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTechnicianDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: technicianDetails['technicians'] == null
          ? const Center(child: Text("data loading.."))
          : SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "$imageUrl${technicianDetails["technicians"]["org_pic"]}"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                      left: 20,
                      top: 70,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const Home()));
                              },
                              icon: const Icon(
                                Icons.menu_open_sharp,
                                color: Color(0xFF363f93),
                              )),
                        ],
                      )),
                  Positioned(
                      top: 320,
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 30, left: 20, right: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${technicianDetails["technicians"]["name"]}",
                                  style: sourceFontBold.copyWith(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Contact ${technicianDetails["technicians"]["phone_number"]}",
                                  style: sourceFontBold.copyWith(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Kenya, ${technicianDetails["technicians"]["location"]}",
                                  style: sourceFontBold.copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Wrap(
                                    children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < 4
                                        ? Color(0xFF363f93)
                                        : Colors.grey.shade600,
                                  );
                                })),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "0.0",
                                  style: sourceFontMedium.copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "${technicianDetails["technicians"]["owner"]}",
                              style: sourceFontSemiBold.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${technicianDetails["technicians"]["description"]}",
                              style: sourceFontRegular.copyWith(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Firm Description",
                              style: sourceFontBold.copyWith(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${technicianDetails["technicians"]["description"]}",
                              style: sourceFontRegular.copyWith(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
    );
  }
}
