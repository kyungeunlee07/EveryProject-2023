import 'dart:convert';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:app/src/widget/Writings/DeleteButton.dart';
import '../../widget/Writings/WritingsProfile.dart';
import '../../widget/Writings/UpdateButton.dart';
import '../../widget/Writings/WritingsInfo.dart';
import '../../widget/comment/commentContainer.dart';
import '../../widget/comment/CommentInput.dart';

class WritingsDetail extends StatelessWidget {
  const WritingsDetail({super.key});

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
                    Text("세종대왕"),
                    Text('2023-01-23',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(
                  "훈민정음혜례본",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Text(
                  "나랏말싸미 듕귁에 달아 문자와로 서르 사맛디 아니할쎄 이런 젼차로 어린 백셩이 니르고져 홀 배 이셔도 마참내 제 뜨들 시러펴디 몯 할 노미 하니라 내 이랄 위하야 어엿비 너겨 새로 스믈 여듧 짜랄 맹가노니사람마다 해여 수비 니겨 날로 쑤메 뼌한킈 하고져 할따라미니라",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    UpdateButton(),
                    SizedBox(
                      width: 10,
                    ),
                    DeleteButton(),
                  ],
                ),
                Divider(thickness: 2, height: 20, color: Colors.grey),
                Text(
                  "댓글",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                CommentContiner(),
                SizedBox(height: 220),
                CommentInput(),
              ],
            )));
  }
}
