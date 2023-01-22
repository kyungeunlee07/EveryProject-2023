import 'dart:convert';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import '../../widget/FriendProfile.dart';

class FriendDetail extends StatelessWidget {
  const FriendDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Every Project',
            style: TextStyle(
                color: Color.fromARGB(255, 230, 54, 41),
                fontSize: 15,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          centerTitle: false,
          backgroundColor: Color.fromARGB(255, 250, 250, 250),
          elevation: 0,
          foregroundColor: Color.fromARGB(255, 230, 54, 41),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "사용자 Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                FriendProfile(),
                SizedBox(height: 20),
                Divider(thickness: 1, color: Color.fromARGB(255, 230, 54, 41)),
                SizedBox(height: 10),
                Text(
                  "작성글",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Divider(thickness: 1, color: Color.fromARGB(255, 230, 54, 41)),
                SizedBox(height: 10),
                Text("작성글이 들어갈 부분"),
              ],
            )));
  }
}
