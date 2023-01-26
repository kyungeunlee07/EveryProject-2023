import 'package:app/src/repository/friend/FriendRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../model/Board.dart';

class WritingsListInfo extends StatelessWidget {
  BoardModel board;
  WritingsListInfo(this.board, {super.key});
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
                        Text("${board.id}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("@${board.title}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 114, 113, 113))),
                        SizedBox(height: 5),
                        Text("${board.writer}"),
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
