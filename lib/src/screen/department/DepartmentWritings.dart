import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test/src/screen/department/DepartmentList.dart';
import 'package:test/src/screen/user/UserProfile.dart';
import 'package:test/src/screen/friend/FriendList.dart';
import 'package:test/src/screen/Writings/WritingsList.dart';

import 'package:flutter/material.dart';

class DepartmentWritings extends StatefulWidget {
  const DepartmentWritings({Key? key}) : super(key: key);

  @override
  State<DepartmentWritings> createState() => _DepartmentWritings();
}

class _DepartmentWritings extends State<DepartmentWritings> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    WritingsList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Every Project',
          style:
              TextStyle(color: Color.fromARGB(255, 230, 54, 41), fontSize: 15),
          textAlign: TextAlign.center,
        ),
        centerTitle: false,
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        elevation: 0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
