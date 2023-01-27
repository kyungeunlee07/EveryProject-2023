import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../model/CommentModel.dart';

class CommentItem extends StatelessWidget {
  final CommentModel comment;
  const CommentItem(this.comment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${comment.writer}",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          SizedBox(height: 5),
          Text("${comment.content}")
        ],
      ),
    );
  }
}
