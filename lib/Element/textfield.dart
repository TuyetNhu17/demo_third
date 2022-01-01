import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget form(String a, IconData icon, TextInputType type, bool obcure) {
  return TextFormField(
    decoration: InputDecoration(labelText: a, icon: Icon(icon),labelStyle: TextStyle(color: Colors.black),focusColor: Colors.black),
    keyboardType: type,
    obscureText: obcure,
    // validator: (newvalue) {
    //   if (newvalue.isEmpty) {
    //     return '$a is required';
    //   }
    // },
    // onSaved: (value) => ,
  );
}