import 'package:flutter/material.dart';
import 'package:x_and_o/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff200757),
        splashColor: const Color(0xffFF2C8F),
        shadowColor: const Color(0xff1442BB)

      ),
      home: const HomePage(),
    );
  }
}


