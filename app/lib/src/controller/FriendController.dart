import 'dart:io';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:app/src/model/Friend.dart';
import 'package:app/src/repository/friend/FriendRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FriendController extends GetxController {
  final friendRepo = Get.put(FriendRepository());
  List friendList = [];

  Future<bool> friendIndex(String id) async {
    List? body = await friendRepo.showFriendList(id);
    print(body);
    if (body == null) {
      return false;
    }
    List friend = body.map(((e) => FriendModel.parse(e))).toList();
    friendList = friend;
    print(friendList.length);
    update();
    return true;

    //   profileShow(String token) async {
    //   Map body = await profileRepo.showMyProfile(token);
    //   ProfileModel profile = ProfileModel.parse(body['values'][0]);
    //   profileOne = profile;
    //   return profile;
    // }
  }

  // // 친구 상세 정보
  // friendShow(String id) async {
  //   Map? body = await friendRepo.showFriendDetail(id);
  //   if (body == null) {
  //     return null;
  //   }
  //   FriendModel friend = FriendModel.parse(body);
  //   feedOne = friend;
  //   update();
  //   return friend;
  // }

  // // 친구 요청 수락
  // friendCreate(String content, int? imageId) async {
  //   await friendRepo.accept;
  //   await feedIndex();
  // }

  // 친구 삭제
  friendDelete(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('id');
    await friendRepo.deleteFriend(id);
    if (token == null) return;
    await friendIndex(token);
  }
}
