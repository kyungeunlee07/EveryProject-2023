import 'package:app/src/screen/friend/FriendDetail.dart';
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
    return InkWell(onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FriendDetail()),
      );
    }, child: Container(
      child: ListView.builder(itemBuilder: ((context, index) {
        return Column(
          children: [
            Container(
                width: double.infinity,
                height: 90,
                child: Row(children: [
                  SizedBox(width: 10),
                  FriendProfile(),
                  SizedBox(width: 125),
                  Column(
                    children: [
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.group_add),
                        label: Text("친구 추가"),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(90, 40),
                          backgroundColor: Color.fromARGB(255, 230, 54, 41),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ],
                  )
                ])),
          ],
        );
      })),
    ));
  }
}
