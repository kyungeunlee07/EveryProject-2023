import 'dart:convert';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:test/src/widget/Writings/DeleteButton.dart';
import '../../widget/Writings/WritingsProfile.dart';
import '../../widget/Writings/UpdateButton.dart';
import '../../widget/Writings/WritingsInfo.dart';

class UpdateWritings extends StatelessWidget {
  const UpdateWritings({super.key});

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
                  "글 제목 수정할 부분",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Text(
                  "글 내용 수정할 부분",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('완료')),
                  ],
                ),
              ],
            )));
  }
}
