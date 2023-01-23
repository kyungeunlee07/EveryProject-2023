import 'package:flutter/material.dart';
import 'Login.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
                  decoration: const InputDecoration(
                    labelText: "  이메일",
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
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "  이름",
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
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
