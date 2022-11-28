import 'dart:convert';

import 'package:finalyear/api/globals.dart';
import 'package:finalyear/screens/home.dart';
import 'package:finalyear/screens/styles.dart';
import 'package:flutter/material.dart';
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
        await http.get(Uri.parse("${baseUrl}flutter/services/view/$userId"));
    setState(() {
      services = json.decode(response.body);
      listServices = services['cart'];
    });
  }

  Future cancel(String id) async {
    http.Response response;
    response =
        await http.get(Uri.parse("${baseUrl}flutter/services/cancel/$id"));
    if (response.statusCode == 200) {
      successSnackBar((context), "Order Cancelled successfully");
    } else {
      errorSnackBar((context), "${response.statusCode}");
    }
  }

  @override
  void initState() {
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
                  Container(
                    height: height * 0.1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 247, 186, 246),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: height * 0.02,
                          left: width * 0.01,
                          child: const Text("My services",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                        Positioned(
                            top: height * 0.025,
                            left: width * 0.6,
                            child: const Icon(
                              Icons.room_service,
                              color: Colors.black,
                              size: 20,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 250,
                    ),
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black12),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              child: Image.network(
                                imageUrl + listServices[index]['picture'],
                                fit: BoxFit.cover,
                                height: 150,
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                children: [
                                  Text("Service",
                                      style: sourceFontBold.copyWith(
                                          fontSize: 15,
                                          color: Color(0xFF363f93))),
                                  Text(
                                    "${listServices[index]['name']}",
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Amount"),
                                      Text(
                                        "Ksh. ${listServices[index]['value']}",
                                        style: sourceFontSemiBold,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.005,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.redAccent),
                                          onPressed: () {
                                            cancel(listServices[index]['id']
                                                .toString());
                                          },
                                          icon: const Icon(
                                            Icons.warning,
                                            color: Colors.white,
                                            size: 8,
                                          ),
                                          label: const Text('Cancel'))
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: listServices == null ? 0 : listServices.length,
                  ),
                ],
              ),
            ),
    );
  }
}
