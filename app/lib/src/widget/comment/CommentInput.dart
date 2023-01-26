import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../style/user/TextFormFieldStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/CommentController.dart';
import 'package:get/get.dart';

final commentController = Get.put(CommentController());

class CommentInput extends StatefulWidget {
  const CommentInput({super.key});

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  final _formKey = GlobalKey<FormState>();
  final _contentController = TextEditingController();

  void _submitButton() async {
    final prefs = await SharedPreferences.getInstance();
    String content = _contentController.text;
    String? message = await commentController.commentCreate(content);
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Form(
            key: _formKey,
            child: Expanded(
              child: TextFormField(
                controller: _contentController,
                decoration: TextFormFieldStyle("댓글"),
                cursorColor: Color.fromARGB(255, 230, 54, 41),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: _submitButton,
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(10, 50),
                backgroundColor: Color.fromARGB(255, 230, 54, 41),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                )),
            child: const Text(
              '전송',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
