import 'package:finalyear/screens/auth/register.dart';
import 'package:finalyear/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    String token;
    void check() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      token = preferences.getString("token")!;
      // token==null?
      //  Navigator.push(
      //       (context),
      //       MaterialPageRoute(
      //           builder: (BuildContext context) => const Register()))
      // : Navigator.push((context),
      //       MaterialPageRoute(builder: (BuildContext context) => const Home()));

      if (token.isEmpty) {
        Navigator.push(
            (context),
            MaterialPageRoute(
                builder: (BuildContext context) => const Register()));
      } else {
        Navigator.push((context),
            MaterialPageRoute(builder: (BuildContext context) => const Home()));
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFF363f93),
      body: Center(
        child: Container(
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
                      backgroundColor: Color(0xFF363f93),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20)),
                  onPressed: () {
                    check();
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: const Text('Get started'))
            ],
          ),
        ),
      ),
    );
  }
}
