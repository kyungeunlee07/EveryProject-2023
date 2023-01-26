import 'package:app/src/repository/friend/FriendRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../model/Friend.dart';
import 'FriendButton.dart';

class FriendInfo extends StatelessWidget {
  Friend friend;
  FriendInfo(this.friend, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${friend.name}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("@${friend.id}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 114, 113, 113))),
                        SizedBox(height: 5),
                        Text("${friend.department}"),
                      ],
                    )
                  ],
                )
              ],
            ),
            FriendButton(),
          ],
        ));
  }
}
