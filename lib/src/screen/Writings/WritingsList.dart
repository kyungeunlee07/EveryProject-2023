import 'package:test/src/screen/Writings/WritingsDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../widget/Writings/WritingsProfile.dart';
import '../../widget/Writings/WritingsInfo.dart';

class WritingsList extends StatefulWidget {
  const WritingsList({super.key});

  @override
  State<WritingsList> createState() => _WritingsListState();
}

class _WritingsListState extends State<WritingsList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WritingsDetail()),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
          child: ListView.builder(itemBuilder: ((context, index) {
            return Container(
                width: double.infinity,
                height: 90,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [WritingsInfo()]));
          })),
        ));
  }
}
