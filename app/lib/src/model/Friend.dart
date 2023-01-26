class Friend {
  String? id;
  String? name;
  int? sid;
  String? department;
  String? email;

  Friend({
    required this.id,
    required this.name,
    required this.sid,
    required this.department,
    required this.email,
  });

  Friend.fromMap(Map<String, dynamic>? map) {
    id = map?['id'] ?? '';
    name = map?['name'] ?? '';
    sid = map?['sid'] ?? '';
    department = map?['department'] ?? '';
    email = map?['email'] ?? '';
  }
}
