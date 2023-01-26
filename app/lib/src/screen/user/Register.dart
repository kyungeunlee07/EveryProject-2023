import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/user/UserRepository.dart';
import '../../style/user/TextFormFieldStyle.dart';
import 'Login.dart';
import 'dart:convert';
import 'package:app/src/screen/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _sidController = TextEditingController();
  final _departmentController = TextEditingController();
  final _userRepository = UserRepository();

  void _submitButton() async {
    final prefs = await SharedPreferences.getInstance();
    String id = _idController.text;
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String sid = _sidController.text;
    String department = _departmentController.text;
    String? token = await _userRepository.register(
        id, name, email, password, sid, department);
    if (token == null) return;
    Map<String, dynamic> user = jsonDecode(token);
    prefs.setString("id", user['id']);
    if (token != null) {
      await prefs.setString('token', token);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (b) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 160, horizontal: 30),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Every Project",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 174, 173, 173)),
                ),
                SizedBox(height: 7),
                const Text(
                  "회원가입",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: _idController,
                  validator: (String? value) {
                    if (value == null || value!.trim().isEmpty) {
                      return "아이디를 입력해야 합니다.";
                    }
                    return null;
                  },
                  decoration: TextFormFieldStyle("아이디"),
                  cursorColor: Color.fromARGB(255, 230, 54, 41),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  validator: (String? value) {
                    if (value == null || value!.trim().isEmpty) {
                      return "비밀번호를 입력해야 합니다.";
                    }
                    return null;
                  },
                  decoration: TextFormFieldStyle("비밀번호"),
                  cursorColor: Color.fromARGB(255, 230, 54, 41),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _nameController,
                  validator: (String? value) {
                    if (value == null || value!.trim().isEmpty) {
                      return "이름을 입력해야 합니다.";
                    }
                    return null;
                  },
                  decoration: TextFormFieldStyle("이름"),
                  cursorColor: Color.fromARGB(255, 230, 54, 41),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  validator: (String? value) {
                    if (value == null || value!.trim().isEmpty) {
                      return "이메일을 입력해야 합니다.";
                    }
                    return null;
                  },
                  decoration: TextFormFieldStyle("이메일"),
                  cursorColor: Color.fromARGB(255, 230, 54, 41),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _sidController,
                  decoration: TextFormFieldStyle("학번"),
                  cursorColor: Color.fromARGB(255, 230, 54, 41),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _departmentController,
                  decoration: TextFormFieldStyle("학과"),
                  cursorColor: Color.fromARGB(255, 230, 54, 41),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _submitButton,
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(400, 50),
                      backgroundColor: Color.fromARGB(255, 230, 54, 41),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  child: const Text(
                    '회원가입 완료',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
