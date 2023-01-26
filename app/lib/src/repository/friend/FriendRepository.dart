import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/Friend.dart';
import 'package:get/get.dart';
import '../../controller/UserController.dart';
import '../../shared/global.dart';

class FriendRepository extends GetConnect {
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

  //친구 목록 확인
  Future<List?> showFriendList(String id) async {
    Response response = await post(
      '/api/friend/show',
      {'id': id},
      headers: {'token': await userController.getToken()},
    );
    return (response.statusCode == 200) ? response.body['values'] : null;
  }

  // //친구 요청 수락
  // accept(String id) async {
  //   var url = Uri.http('localhost:3000', '/api/friend/insert');
  //   var response = await http.post(url, body: {
  //     'id': id,
  //   });
  //   print('Response status: ${response.statusCode}');
  //   print('Response body: ${response.body}');
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     return null;
  //   }
  // }

  // 친구 삭제
  deleteFriend(String id) async {
    Response response = await post(
      '/api/friend/del',
      {'id': id},
      headers: {'token': await userController.getToken()},
    );
    return (response.statusCode == 200) ? response.body['values'] : null;
  }

  // // 친구 상세 정보 확인
  // showFriendDetail(String id) async {
  //   Response response = await get(
  //     "/api/feed/$id",
  //     headers: {'token': await userController.getToken()},
  //   );
  //   return (response.statusCode == 200) ? response.body : null;
  // }
}
