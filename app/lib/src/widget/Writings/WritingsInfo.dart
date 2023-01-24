import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'UpdateButton.dart';
import 'WritingsProfile.dart';

class WritingsInfo extends StatelessWidget {
  const WritingsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WritingsProfile(),
      ],
    ));
  }
}
