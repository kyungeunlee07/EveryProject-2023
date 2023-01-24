import 'package:http/http.dart' as http;

class UserRepository {
  register(String id, String name, String email, String password, String sid,
      String department) async {
    var url = Uri.http('localhost:3000', 'api/user/register');
    var response = await http.post(url, body: {
      'id': id,
      'name': name,
      'email': email,
      'pw': password,
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
