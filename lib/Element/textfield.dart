import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget form(String a, IconData icon, TextInputType type, bool obcure,TextEditingController controllername) {
  return TextFormField(
    decoration: InputDecoration(labelText: a, icon: Icon(icon),labelStyle: TextStyle(color: Colors.black),focusColor: Colors.black),
    keyboardType: type,
    obscureText: obcure,
    controller: controllername,
    // validator: (value) {
    //   if (alue.isEmpty) {
    //     return 'Vui lòng nhập $controllername';
    //   }
    // },
    // onSaved: (value) => ,
  );
}