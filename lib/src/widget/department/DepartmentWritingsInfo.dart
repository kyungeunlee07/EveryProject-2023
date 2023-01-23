import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test/src/widget/department/DepartmentWritingsProfile.dart';

class DepartmentWritingsInfo extends StatelessWidget {
  const DepartmentWritingsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DepartmentWritingsProfile(),
      ],
    ));
  }
}
