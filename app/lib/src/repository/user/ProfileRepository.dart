import 'dart:io';

import 'package:get/get.dart';
import 'package:app/src/controller/UserController.dart';

import '../../shared/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository extends GetConnect {
  final userController = Get.put(UserController());

  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.API_ROOT;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  Future<Map> showMyProfile(String token) async {
    Response response = await post(
      "/api/user",
      {'id': token},
      headers: {'token': token},
    );

    return (response.statusCode == 200) ? response.body : null;
  }
}
