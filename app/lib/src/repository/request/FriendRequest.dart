import 'package:app/src/model/Friend.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginRepository {
  //친구 요청 수락
  accept(String id) async {
    var url = Uri.http('localhost:3000', '/api/friend/insert');
    var response = await http.post(url, body: {
      'id': id,
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  // 친구 삭제
  deleteFriend(String id) async {
    var url = Uri.http('localhost:3000', '/api/friend/del');
    var response = await http.post(url, body: {
      'id': id,
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
