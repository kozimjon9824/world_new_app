import 'package:flutter/material.dart';
import 'package:world_new_app/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

