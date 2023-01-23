import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test/src/screen/Writings/UpdateWritings.dart';

class UpdateButton extends StatefulWidget {
  const UpdateButton({super.key});

  @override
  State<UpdateButton> createState() => _UpdateButtonState();
}

class _UpdateButtonState extends State<UpdateButton> {
  var nowIcon = Icons.update;
  String text = "피드 수정";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UpdateWritings()));
        },
        icon: Icon(nowIcon),
        label: Text("${text}"),
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(90, 40),
          backgroundColor: Color.fromARGB(255, 230, 54, 41),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}
