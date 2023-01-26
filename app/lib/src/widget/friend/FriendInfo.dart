import 'package:app/src/controller/FriendController.dart';
import 'package:app/src/repository/friend/FriendRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../model/Friend.dart';
import 'FriendButton.dart';

class FriendInfo extends StatelessWidget {
  FriendModel friend;
  FriendInfo(this.friend, {super.key});
  final friendController = FriendController();
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
                        Text("@${friend.name}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("${friend.department}",
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
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("친구 삭제"),
                        content: Text('정말 삭제하시겠습니까?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () =>
                                {friendController.friendDelete(friend.id)},
                            child: const Text('OK'),
                          )
                        ],
                      );
                    });
              },
              icon: Icon(Icons.person_remove),
              label: Text("친구 삭제"),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(90, 40),
                backgroundColor: Color.fromARGB(255, 230, 54, 41),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ],
        ));
  }
}
