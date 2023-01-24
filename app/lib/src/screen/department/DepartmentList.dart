import 'package:app/src/screen/department/DepartmentDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:app/src/screen/department/DepartmentWritings.dart';
import 'package:app/src/widget/department/DepartmentWritingsInfo.dart';
import '../../widget/department/DepartmentProfile.dart';
import '../../widget/department/DepartmentInfo.dart';

class DepartmentList extends StatefulWidget {
  const DepartmentList({super.key});

  @override
  State<DepartmentList> createState() => _DepartmentListState();
}

class _DepartmentListState extends State<DepartmentList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DepartmentWritings()),
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
                    children: [DepartmentInfo()]));
          })),
        ));
  }
}
