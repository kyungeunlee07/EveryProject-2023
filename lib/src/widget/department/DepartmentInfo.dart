import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'DepartmentProfile.dart';

class DepartmentInfo extends StatelessWidget {
  const DepartmentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DepartmentProfile(),
      ],
    ));
  }
}
