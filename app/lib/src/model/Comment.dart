class Comment {
  int? id;
  int? board;
  String? content;
  String? writer;
  String? created_at;
  String? updated_at;

  Comment(
      {required this.id,
      required this.board,
      required this.content,
      required this.writer,
      required this.created_at,
      required this.updated_at});

  Comment.fromMap(Map<String, dynamic>? map) {
    id = map?['id'] ?? '';
    board = map?['board'] ?? '';
    content = map?['content'] ?? '';
    writer = map?['writer'] ?? '';
    created_at = map?['created_at'] ?? '';
    updated_at = map?['updated_at'] ?? '';
  }
}
