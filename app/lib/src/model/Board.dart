class BoardModel {
  int? id;
  String? title;
  String? writer;
  String? department;
  String? created_at;
  String? updated_at;

  BoardModel(
      {required this.id,
      required this.title,
      required this.writer,
      required this.department,
      required this.created_at,
      required this.updated_at});

  BoardModel.parse(Map m) {
    id = m['id'];
    title = m['title'];
    writer = m['writer'];
    department = m['department'];
    created_at = m['created_at'];
    updated_at = m['updated_at'];
  }
}
