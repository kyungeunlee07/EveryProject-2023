class ProfileModel {
  String? name;
  int? sid;
  String? department;

  ProfileModel.parse(Map m) {
    name = m['name'];
    sid = m['sid'];
    department = m['department'];
  }
}
