import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/BoardController.dart';
import '../../widget/Writings/WritingslistInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WritingsList extends StatefulWidget {
  const WritingsList({super.key});

  @override
  State<WritingsList> createState() => _WritingsListState();
}

class _WritingsListState extends State<WritingsList> {
  @override
  final boardController = Get.put(BoardController());
  List? boardList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('id');
    if (token == null) return;
    bool result = await boardController.boardIndex(token);
    print(result);
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
      child: GetBuilder<BoardController>(builder: (c) {
        return ListView.separated(
          itemBuilder: (context, index) => WritingsListInfo(c.boardList[index]),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: c.boardList.length,
        );
      }),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../../controller/UserController.dart';

// class WritingsList extends StatefulWidget {
//   const WritingsList({super.key});
//   _WritingsList createState() => _WritingsList();
//   final userController = Get.put(UserController());
// }

// class _WritingsList extends State<WritingsList> {
//   List data = [];

//   Future<String> getData() async {
//     var response = await http.post(
//       Uri.parse("https://jsonplaceholder.typicode.com/posts"),
//       headers: {"Accept": "application/json"},
//     );

//     this.setState(() {
//       data = json.decode(response.body);
//     });

//     return "Success";
//   }

//   @override
//   void initState() {
//     super.initState();
//     this.getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("HTTP Example"),
//         ),
//         body: ListView.builder(
//           itemCount: data == null ? 0 : data.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Card(
//               child: Text(data[index]["title"]),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:app/src/screen/user/Login.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../../controller/UserController.dart';

// class WritingsList extends StatefulWidget {
//   const WritingsList({super.key});
//   @override
//   State<WritingsList> createState() => _WritingsListState();
// }

// class _WritingsListState extends State<WritingsList> {
//   @override
//   List data = [];
//   final userController = Get.put(UserController());
//   Future<String> getData() async {
//     var response = await http.post(
//       Uri.parse("http://localhost:3000/api/feed/show"),
//       headers: {"token": await userController.getToken()},
//     );

//     this.setState(() {
//       data = json.decode(response.body);
//     });

//     return "Success";
//   }

//   @override
//   void initState() {
//     super.initState();
//     this.getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("HTTP Example"),
//         ),
//         body: ListView.builder(
//           itemCount: data == null ? 0 : data.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Card(
//               child: Text(data[index]["title"]),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
