import 'package:bmi/screens/home.dart';
import 'package:bmi/screens/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black38,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 45, fontWeight: FontWeight.w800, color: Colors.white),
          headline2: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          bodyText1: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home_screen',
      routes: {
        '/result_screen': (context) => Result(88.0, true, 55),
        '/home_screen': (context) => Home(),
      },
    );
  }
}
