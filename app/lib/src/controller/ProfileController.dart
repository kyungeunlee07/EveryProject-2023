import 'dart:io';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:app/src/model/ProfileModel.dart';
import 'package:app/src/repository/user/ProfileRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/src/token/decodeToken.dart';

class ProfileController extends GetxController {
  ProfileModel? profileOne;
  final profileRepo = Get.put(ProfileRepository());

  profileShow() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) return;
    Map body = await profileRepo.showMyProfile(token);
    ProfileModel profile = ProfileModel.parse(body['values'][0]);
    profileOne = profile;
    return profile;
  }
}
