import 'package:flutter/material.dart';
import 'screen/user/Login.dart';
import 'screen/home.dart';
import 'screen/user/Login.dart';

class MyApp extends StatelessWidget {
  String? token;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NanumGothic',
        primaryColor: const Color.fromARGB(255, 230, 54, 41),
      ),
      home: (token == null) ? Login() : Home(),
    );
  }
}
