import 'package:app/src/controller/BoardController.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/Friend.dart';
import 'package:get/get.dart';
import '../../controller/UserController.dart';
import '../../shared/global.dart';

class BoardRepository extends GetConnect {
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

  //친구 목록 확인 (전체)
  Future<List?> showBoardList(String id) async {
    Response response = await get(
      '/api/feed?id=$id',
      headers: {'token': await userController.getToken()},
    );
    return (response.statusCode == 200) ? response.body['values'] : null;
  }

  //친구 목록 확인 (학과별)
  Future<List?> showDepartmentList(String department) async {
    Response response = await post(
      '/api/feed/department',
      {'department': department},
      headers: {'token': await userController.getToken()},
    );
    return (response.statusCode == 200) ? response.body['values'] : null;
  }
}
