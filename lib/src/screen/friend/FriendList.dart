import 'package:test/src/screen/friend/FriendDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../widget/friend/FriendProfile.dart';
import '../../widget/friend/FriendInfo.dart';

class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FriendDetail()),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
          child: ListView.builder(itemBuilder: ((context, index) {
            return Container(
                width: double.infinity,
                height: 90,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [FriendInfo()]));
          })),
        ));
  }
}
