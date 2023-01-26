import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/Friend.dart';

class FriendRepository {
  //친구 목록 확인
  Future<List<Friend>> showFriendList(String id) async {
    List<Friend> friendList = [];
    var url = Uri.http('localhost:3000', '/api/friend/show');
    var response = await http.post(url, body: {'id': id});
    if (response.statusCode == 200) {
      friendList =
          jsonDecode(response.body)['values'].map<Friend>((friendList) {
        return Friend.fromMap(friendList);
      }).toList();
    }
    return friendList;
  }

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

  // 친구 삭제
  showFriendDetail(String id) async {
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
