import 'package:azkari/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Azkari',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       appBarTheme: AppBarTheme(
         elevation: 0.0,
         color: Colors.green,
         centerTitle: true,
          ),
        fontFamily: 'Tajawal-Regular',

      ),
      home:  HomeScreen(),
    );
  }
}
