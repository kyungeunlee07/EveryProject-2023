class Profile {
  late String name;
  late int sid;
  late String department;

  Profile({required this.name, required this.sid, required this.department});

  Profile.formMap(Map<String, dynamic>? map) {
    name = map?['name'] ?? '';
    sid = map?['sid'] ?? '';
    department = map?['department'] ?? '';
  }
}
