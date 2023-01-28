import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CreateFriend extends StatefulWidget {
  const CreateFriend({super.key});

  @override
  State<CreateFriend> createState() => _CreateFriendState();
}

class _CreateFriendState extends State<CreateFriend> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("친구를 추가하시겠습니까?"),
    );
  }
}
