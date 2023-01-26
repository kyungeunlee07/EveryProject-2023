import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'commentProfile.dart';
import 'CommentInput.dart';

class CommentContiner extends StatefulWidget {
  const CommentContiner({super.key});

  @override
  State<CommentContiner> createState() => _CommentContinerState();
}

class _CommentContinerState extends State<CommentContiner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        commentProfile(),
        SizedBox(height: 10),
        Text("좋은글입니다."),
      ],
    );
  }
}
