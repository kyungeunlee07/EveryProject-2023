import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../widget/friend/FriendInfo.dart';
import '../../model/Friend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/FriendController.dart';
import 'package:get/get.dart';

class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  final friendController = Get.put(FriendController());
  List? friendList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('id');
    if (token == null) return;
    bool result = await friendController.friendIndex(token);
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
      child: GetBuilder<FriendController>(builder: (c) {
        return ListView.separated(
          itemBuilder: (context, index) => FriendInfo(c.friendList[index]),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: c.friendList.length,
        );
      }),
    );
  }
}
