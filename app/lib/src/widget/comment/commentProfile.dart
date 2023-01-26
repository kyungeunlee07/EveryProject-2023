import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class commentProfile extends StatefulWidget {
  const commentProfile({super.key});

  @override
  State<commentProfile> createState() => _commentProfileState();
}

class _commentProfileState extends State<commentProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(
          "이경은",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Text("20203030"),
      ]),
    );
  }
}
