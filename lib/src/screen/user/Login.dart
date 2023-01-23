import 'Register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 180),
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
                  decoration: const InputDecoration(
                    labelText: "  아이디",
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 233, 233, 233),
                        width: 30,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 233, 233, 233),
                        width: 30,
                      ),
                    ),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 233, 233, 233)),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 233, 233),
                  ),
                  cursorColor: Color.fromARGB(255, 230, 54, 41),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "  비밀번호",
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 233, 233, 233),
                        width: 30,
                      ),
                    ),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 233, 233, 233)),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 233, 233),
                  ),
                  cursorColor: Color.fromARGB(255, 230, 54, 41),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
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
