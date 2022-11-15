import 'package:finalyear/screens/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ServiceDetail extends StatefulWidget {
  const ServiceDetail({super.key});

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
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
                        image: AssetImage("images/welcome.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
                left: 20,
                top: 70,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu_open_sharp,
                          color: Colors.white,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
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
                            "Name",
                            style: sourceFontBold.copyWith(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "\$ 250",
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
                            "Kenya, Nairobi",
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
                              color: index < activeStars
                                  ? Color(0xFF363f93)
                                  : Colors.grey.shade600,
                            );
                          })),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${activeStars}.0",
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
                        "AIA Automobiles",
                        style: sourceFontSemiBold.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "This is a simple firm that does all the process of making cars from scratch to finality",
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
                        "This is a simple service that does all the process of making cars from scratch to finality",
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
                          padding: EdgeInsets.symmetric(horizontal:0,vertical: 17)),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.local_activity,
                        color: Colors.white,
                        size: 22,
                      ),
                      label: Text('')),
                      const SizedBox(width: 10,),

                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF363f93),
                          padding: EdgeInsets.symmetric(horizontal:75,vertical: 17)),
                      onPressed: () {},
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
