class FriendModel {
  late String id;
  String? name;
  int? sid;
  String? department;
  String? email;

  FriendModel.parse(Map m) {
    id = m['id'];
    name = m['name'];
    sid = m['sid'];
    department = m['department'];
    email = m['email'];
  }
}
