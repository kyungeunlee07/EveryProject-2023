import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FriendButton extends StatefulWidget {
  const FriendButton({super.key});

  @override
  State<FriendButton> createState() => _FriendButtonState();
}

class _FriendButtonState extends State<FriendButton> {
  var nowIcon = Icons.group_add;
  String text = "친구 추가";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            nowIcon = (nowIcon == Icons.group_add)
                ? Icons.person_remove
                : Icons.group_add;
            text = (text == "친구 추가") ? "친구 삭제" : "친구 추가";
          });
        },
        icon: Icon(nowIcon),
        label: Text("${text}"),
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(90, 40),
          backgroundColor: Color.fromARGB(255, 230, 54, 41),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}
