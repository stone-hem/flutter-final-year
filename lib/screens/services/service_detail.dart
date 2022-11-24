import 'dart:convert';

import 'package:finalyear/api/globals.dart';
import 'package:finalyear/api/services.dart';
import 'package:finalyear/screens/home.dart';
import 'package:finalyear/screens/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ServiceDetail extends StatefulWidget {
  String serviceId;
  ServiceDetail({super.key, required this.serviceId});

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  Map serviceDetail = {};
  List listServiceDetails = [];
  Map serverRes = {};
  String userId = '';

  Future getServiceDetails() async {
    http.Response response;
    response = await http.get(
        Uri.parse("${baseUrl}flutter/services/create/${widget.serviceId}"));
    if (response.statusCode == 200) {
      // print(response.body);
      setState(() {
        serviceDetail = json.decode(response.body);
      });
    }
  }

  Future order() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("id")!;
    Map data = {
      "user_id": userId,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseUrl + 'flutter/services/store/${widget.serviceId}');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      successSnackBar(context, "Order placed successfully");
    } else {
      errorSnackBar(context, "${response.statusCode}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getServiceDetails();
  }

  int activeStars = 3;
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
                        image: NetworkImage(imageUrl + serviceDetail['service']['picture']),
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
                            "${serviceDetail["service"]["name"]}",
                            style: sourceFontBold.copyWith(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Ksh. ${serviceDetail["service"]["value"]}",
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
                            "Kenya, ${serviceDetail["service"]["location"]}",
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
                              color: index < serviceDetail["service"]["rating"]
                                  ? Color(0xFF363f93)
                                  : Colors.grey.shade600,
                            );
                          })),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${serviceDetail["service"]["rating"]}.0",
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
                        "${serviceDetail["service"]["firm"]}",
                        style: sourceFontSemiBold.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${serviceDetail["service"]["firm_description"]}",
                        style: sourceFontRegular.copyWith(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Service Description",
                        style: sourceFontBold.copyWith(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${serviceDetail["service"]["description"]}",
                        style: sourceFontRegular.copyWith(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
              bottom: 10,
              left: 10,
              child: Row(
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          padding: EdgeInsets.symmetric(
                              horizontal: 0, vertical: 17)),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.local_activity,
                        color: Colors.white,
                        size: 22,
                      ),
                      label: Text('')),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF363f93),
                          padding: EdgeInsets.symmetric(
                              horizontal: 75, vertical: 17)),
                      onPressed: () {
                        order();
                      },
                      icon: const Icon(
                        Icons.book_online_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                      label: Text('Order Service')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
