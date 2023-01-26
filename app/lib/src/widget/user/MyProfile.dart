import 'dart:async';

import 'package:app/src/controller/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:app/src/repository/user/ProfileRepository.dart';
import 'package:app/src/model/ProfileModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

final profileController = ProfileController();

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String? name = '';
  String? department = '';
  int? sid = 0;

  void onInit() async {
    ProfileModel profile = await profileController.profileShow();
    name = profile.name;
    department = profile.department;
    sid = profile.sid;
  }

  @override
  void initState() {
    super.initState();
    onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${name}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('${sid}',
                      style:
                          TextStyle(color: Color.fromARGB(255, 114, 113, 113))),
                  SizedBox(height: 5),
                  Text("${department}"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
