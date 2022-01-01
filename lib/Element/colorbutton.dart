import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget colorbutton(FlatButton button) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      gradient: const LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xc6ff7f50),
          Color(0x40ee6a50),
        ],
      ),
    ),
    child: button,
  );
}
