import 'package:flutter/material.dart';

class FriendProfile extends StatelessWidget {
  const FriendProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: Column(
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
                  Text("name", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("id",
                      style:
                          TextStyle(color: Color.fromARGB(255, 114, 113, 113))),
                  SizedBox(height: 5),
                  Text("상태메시지"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
