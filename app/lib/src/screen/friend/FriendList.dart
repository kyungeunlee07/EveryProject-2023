import 'package:app/src/screen/friend/FriendDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../widget/friend/FriendInfo.dart';
import '../../model/Friend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/friend/FriendRepository.dart';

class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  final _friendRepository = FriendRepository();
  List<Friend> friendList = [];

  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('id');
    if (token == null) return;
    friendList = await _friendRepository.showFriendList(token);
  }

  @override
  Widget build(BuildContext context) {
    onInit();
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FriendDetail()),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
          child: ListView.builder(
              itemCount: friendList.length,
              itemBuilder: ((context, index) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FriendInfo(friendList[index]),
                    ]);
              })),
        ));
  }
}
