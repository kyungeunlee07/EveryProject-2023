import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../widget/FriendProfile.dart';

class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemBuilder: ((context, index) {
        return Container(
          width: double.infinity,
          height: 90,
          child: Center(child: FriendProfile()),
        );
      })),
    );
  }
}
