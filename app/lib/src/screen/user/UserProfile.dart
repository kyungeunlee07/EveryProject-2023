import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../../widget/user/MyProfile.dart';
import '../../widget/user/UpdateProfileButton.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "나의 Profile",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    UpdateProfileButton(),
                  ],
                ),
                SizedBox(height: 20),
                MyProfile(),
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
            ))));
  }
}
