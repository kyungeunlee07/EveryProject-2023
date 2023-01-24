import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginRepository {
  login(String id, String password) async {
    var url = Uri.http('localhost:3000', '/api/user/login');
    var response = await http.post(url, body: {
      'id': id,
      'pw': password,
    });
    print(response);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
