import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'FriendButton.dart';
import 'FriendProfile.dart';

class FriendInfo extends StatelessWidget {
  const FriendInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FriendProfile(),
        FriendButton(),
      ],
    ));
  }
}
