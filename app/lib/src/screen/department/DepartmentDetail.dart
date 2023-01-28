import 'dart:convert';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:app/src/screen/Writings/WritingsList.dart';
import 'package:app/src/screen/department/DepartmentWritings.dart';
import 'package:app/src/widget/Writings/WritingsInfo.dart';
import 'package:app/src/widget/department/DepartmentWritingsInfo.dart';
import '../../widget/department/DepartmentWritingsProfile.dart';
import '../../widget/department/DepartmentInfo.dart';

import 'dart:convert';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:app/src/widget/Writings/DeleteButton.dart';
import '../../widget/Writings/WritingsProfile.dart';
import '../../widget/Writings/UpdateButton.dart';
import '../../widget/Writings/WritingsInfo.dart';

class DepartmentDetail extends StatelessWidget {
  const DepartmentDetail({super.key});

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("글쓴이"),
                    Text('2023-01-23',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(
                  "글 제목이 들어갈 부분",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Text(
                  "글 내용이 들어갈 부분",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    UpdateButton(),
                    SizedBox(
                      width: 10,
                    ),
                    DeleteButton(),
                  ],
                ),
              ],
            )));
  }
}
