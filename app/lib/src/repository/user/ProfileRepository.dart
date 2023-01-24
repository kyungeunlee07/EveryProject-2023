import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app/src/model/Profile.dart';

class ProfileRepository {
  var url = Uri.http('localhost:3000', 'api/user');
  Future<List<Profile>> profile(String id) async {
    List<Profile> myProfile = [];
    var response = await http.post(url, body: {
      'id': id,
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      myProfile = jsonDecode(response.body)['values'].map<Profile>((profile) {
        return Profile.formMap(profile);
      }).toList();
    }
    return myProfile;
  }
}
