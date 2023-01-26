import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/src/screen/user/Register.dart';
import '../../repository/user/UserRepository.dart';
import '../../controller/UserController.dart';
import '../../style/user/TextFormFieldStyle.dart';
import '../home.dart';
import 'package:get/get.dart';

final userController = Get.put(UserController());

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userRepositort = UserRepository();

  void _submitButton() async {
    final prefs = await SharedPreferences.getInstance();
    String id = _idController.text;
    String password = _passwordController.text;

    String? token = await userController.login(id, password);

    if (token == null) {
      Get.off(() => const Home());
    } else {
      Get.snackbar("로그인 에러", token, snackPosition: SnackPosition.BOTTOM);
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
                  "대학 생활을 더 편하고 즐겁게",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 174, 173, 173)),
                ),
                SizedBox(height: 7),
                const Text(
                  "Every Project",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: _idController,
                  decoration: TextFormFieldStyle("아이디"),
                  cursorColor: Color.fromARGB(255, 230, 54, 41),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: TextFormFieldStyle("비밀번호"),
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
                    '로그인',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(400, 50),
                      backgroundColor: Color.fromARGB(255, 250, 250, 250),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  child: const Text(
                    '회원가입',
                    style: TextStyle(
                      color: Color.fromARGB(255, 42, 42, 42),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
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
