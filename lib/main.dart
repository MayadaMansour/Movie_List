import 'package:flutter/material.dart';
import 'package:movie_list/screens/home/ui/home_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      title: 'Movie Application',
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: HomePage(),

    );

  }
}

