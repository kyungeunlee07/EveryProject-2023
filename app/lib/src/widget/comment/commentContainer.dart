import 'package:app/src/controller/CommentController.dart';
import 'package:app/src/widget/comment/commentItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'commentProfile.dart';
import 'CommentInput.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentContiner extends StatefulWidget {
  const CommentContiner({super.key});

  @override
  State<CommentContiner> createState() => _CommentContinerState();
}

class _CommentContinerState extends State<CommentContiner> {
  final commentController = Get.put(CommentController());
  List? friendList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('id');
    if (token == null) return;
    bool result = await commentController.commentIndex(1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: GetBuilder<CommentController>(builder: (c) {
          return ListView.separated(
            itemBuilder: (context, index) => CommentItem(c.commentList[index]),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: c.commentList.length,
          );
        }));
  }
}
