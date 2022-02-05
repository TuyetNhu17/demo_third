import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget form(String a, IconData icon, TextInputType type, bool obcure,
    TextEditingController controllername, bool? error) {
  return TextFormField(
    decoration: InputDecoration(
        labelText: a,
        errorText: '',
        icon: Icon(icon),
        labelStyle: TextStyle(color: Colors.black),
        focusColor: Colors.black),
    keyboardType: type,
    obscureText: obcure,
    controller: controllername,
  );
}
