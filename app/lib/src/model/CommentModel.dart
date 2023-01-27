import 'package:flutter/material.dart';

class CommentModel {
  int? id;
  String? content;
  String? writer;

  CommentModel.parse(Map m) {
    id = m['id'];
    content = m['content'];
    writer = m['writer'];
  }
}
