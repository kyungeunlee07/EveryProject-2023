import 'package:flutter/material.dart';
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
      ),
      home: Login(),
    );
  }
}
