import 'package:flutter/material.dart';
import 'package:json_serialization/home_page/first_home_page.dart';
import 'package:json_serialization/home_page/second_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      home: SecondHomePage(),
    );
  }
}
