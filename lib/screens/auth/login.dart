import 'dart:convert';

import 'package:finalyear/api/services.dart';
import 'package:finalyear/screens/home.dart';
import 'package:finalyear/screens/auth/register.dart';
import 'package:finalyear/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/globals.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  _login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      http.Response response = await AuthServices.login(
          emailController.text, passwordController.text);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(responseMap.values.first);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString("token", responseMap["token"].toString());
        await preferences.setString(
            "username", responseMap["user"]["name"].toString());
        await preferences.setString(
            "email", responseMap["user"]["email"].toString());
        await preferences.setString("id", responseMap["user"]["id"].toString());
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Home(),
            ));
      } else {
        errorSnackBar(context, "${responseMap.values.first}");
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
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
                height: height * 0.1,
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
                      onPressed: () {
                        Get.to(const Splash());
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              const Text(
                "Here to get continue",
                style: TextStyle(fontSize: 26, color: Color(0xFF363f93)),
              ),
              const Text(
                "Continue!",
                style: TextStyle(fontSize: 26, color: Color(0xFF363f93)),
              ),
              SizedBox(
                height: height * 0.1,
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
                  const Text(
                    "Log In",
                    style: TextStyle(fontSize: 22, color: Color(0xFF363f93)),
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF363f93),
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20)),
                      onPressed: () {
                        _login();
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
                              builder: (context) => const Register()));
                    },
                    child: const Text(
                      "Register",
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
