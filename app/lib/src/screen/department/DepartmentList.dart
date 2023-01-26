import 'package:flutter/material.dart';

class DepartmentList extends StatefulWidget {
  const DepartmentList({super.key});

  @override
  State<DepartmentList> createState() => _DepartmentListState();
}

class _DepartmentListState extends State<DepartmentList> {
  static const String _title = '한국공학대학교';
  static const List<String> _data = [
    '컴퓨터공학부',
    '기계공학과',
    '생명화학공학과',
    '디자인공학부',
    '신소재공학과'
  ];
  Widget _buildStaticListView() {
    return ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            title: Text(
              _data[i],
              style: TextStyle(fontSize: 23),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) =>
              //   DepartmentDetail(department: _data[i]),),

              // ); 이쪽부분으로 context의 내용으로 다른 페이지로 이동
              print(context);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: _title,
      home: Scaffold(
        body: _buildStaticListView(),
      ),
    );
  }
}
