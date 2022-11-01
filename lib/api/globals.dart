import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const baseUrl = "http://192.168.203.15:8000/api/";

const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar((SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 2),
  )));
}
