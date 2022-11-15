import 'package:finalyear/screens/service_detail.dart';
import 'package:finalyear/splash.dart';
import 'package:flutter/material.dart';

import 'screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ServiceDetail(),
    );
  }
}
