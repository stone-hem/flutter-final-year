import 'package:finalyear/screens/auth/login.dart';
import 'package:finalyear/screens/auth/register.dart';
import 'package:finalyear/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    String? token;
    void check() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      token = preferences.getString("token");

      if (token==null) {
        Navigator.push(
            (context),
            MaterialPageRoute(
                builder: (BuildContext context) => const Login()));
      } else {
        Navigator.push((context),
            MaterialPageRoute(builder: (BuildContext context) => const Home()));
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFF363f93),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "My Mechanic",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF363f93),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20)),
                onPressed: () {
                  check();
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                ),
                label: token==null?Text('Get started'): Text("Continue.."))
          ],
        ),
      ),
    );
  }
}
