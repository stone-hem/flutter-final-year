import 'dart:convert';

import 'package:finalyear/api/get_client.dart';
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
     Map service={};
    List listOfServices=[];

  Future getServices() async {
    http.Response response;
    response = await http.get(Uri.parse("${baseUrl}flutter/services"));
    if (response.statusCode == 200) {
      setState(() {
        service = json.decode(response.body);
        listOfServices=service['services'];
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
    return Scaffold(
      body: service == null
          ? Text("data loading..")
          : SingleChildScrollView(
            child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                           Text(listOfServices[index]['name'].toString()),
                            Text(listOfServices[index]['description'].toString()),
                            SizedBox(height: 5,)
                        ],
                      ),
                    );
                  },
                  itemCount: listOfServices==null? 0:listOfServices.length,
                  )
                ],
              ),
          ),
    );
  }
}
