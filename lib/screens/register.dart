import 'dart:convert';

import 'package:finalyear/api/globals.dart';
import 'package:finalyear/api/services.dart';
import 'package:finalyear/screens/login.dart';
import 'package:finalyear/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  Future _register() async {
    bool validateEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    if (validateEmail) {
      http.Response response = await AuthServices.register(
          nameController.text, emailController.text, passwordController.text);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const Login(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'email not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 30, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                padding: const EdgeInsets.only(left: 0, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFF363f93),
                      ),
                      onPressed: () => Get.to(Splash()),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              const Text(
                "Here to get welcomed",
                style: TextStyle(fontSize: 26, color: Color(0xFF363f93)),
              ),
              const Text(
                "Welcome!",
                style: TextStyle(fontSize: 26, color: Color(0xFF363f93)),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextField(
                controller: nameController,
                style: TextStyle(color: Colors.black),
                cursorColor: Color(0xFF9b9b9b),
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: InputDecoration(
                    hintText: 'username',
                    hintStyle: TextStyle(
                      color: Color(0xFF9b9b9b),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    )),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextField(
                controller: emailController,
                style: TextStyle(color: Colors.black),
                cursorColor: Color(0xFF9b9b9b),
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: InputDecoration(
                    hintText: 'email',
                    hintStyle: TextStyle(
                      color: Color(0xFF9b9b9b),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    )),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.black),
                cursorColor: Color(0xFF9b9b9b),
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'password',
                    hintStyle: TextStyle(
                      color: Color(0xFF9b9b9b),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    )),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Register",
                    style: TextStyle(fontSize: 22, color: Color(0xFF363f93)),
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF363f93),
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20)),
                      onPressed: () {
                        _register();
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      ),
                      label: Text(''))
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(fontSize: 16, color: Color(0xFF363f93)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(fontSize: 16, color: Color(0xFF363f93)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
