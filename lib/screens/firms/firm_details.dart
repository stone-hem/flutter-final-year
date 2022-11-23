import 'dart:convert';

import 'package:finalyear/api/globals.dart';
import 'package:finalyear/screens/home.dart';
import 'package:finalyear/screens/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirmDetail extends StatefulWidget {
  String firmId;
  FirmDetail({super.key, required this.firmId});

  @override
  State<FirmDetail> createState() => _FirmDetailState();
}

class _FirmDetailState extends State<FirmDetail> {
  Map firmDetails = {};

  Future getFirmDetails() async {
    http.Response response;
    response =
        await http.get(Uri.parse("${baseUrl}flutter/firms/${widget.firmId}"));
    if (response.statusCode == 200) {
      // print(response.body);
      setState(() {
        firmDetails = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFirmDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                            "$imageUrl${firmDetails["firm"]["org_pic"]}"),
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
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
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
                            "${firmDetails["firm"]["name"]}",
                            style: sourceFontBold.copyWith(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Contact ${firmDetails["firm"]["phone_number"]}",
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
                            "Kenya, ${firmDetails["firm"]["location"]}",
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
                            "${firmDetails["firm"]["rating"]}.0",
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
                        "${firmDetails["firm"]["owner"]}",
                        style: sourceFontSemiBold.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${firmDetails["firm"]["description"]}",
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
                        "${firmDetails["firm"]["description"]}",
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
