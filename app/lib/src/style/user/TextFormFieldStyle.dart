import 'package:flutter/material.dart';

InputDecoration TextFormFieldStyle(String label) {
  return  InputDecoration(
                    labelText: '  $label',
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
                  );
}