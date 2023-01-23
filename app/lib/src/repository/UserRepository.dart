import 'package:http/http.dart' as http;

class UserRepository {
  register(String id, String name, String email, String password, String sid,
      String department) async {
    var url = Uri.http('172.30.1.58:3000', 'api/user/register');
    print(url);
    var response = await http.post(url, body: {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'sid': sid,
      'department': department
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
