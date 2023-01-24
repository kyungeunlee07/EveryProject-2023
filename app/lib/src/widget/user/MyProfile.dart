import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app/src/repository/user/ProfileRepository.dart';
import 'package:app/src/model/Profile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final _profileRepository = ProfileRepository();
  List<Profile> profile = [];

  void loadData() async {
    profile = await _profileRepository.profile('d');
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
                  Text('${profile[0].name}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('${profile[0].sid}',
                      style:
                          TextStyle(color: Color.fromARGB(255, 114, 113, 113))),
                  SizedBox(height: 5),
                  Text("${profile[0].department}"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
