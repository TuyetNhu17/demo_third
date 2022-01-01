
import 'package:flutter/material.dart';
Widget decor(ElevatedButton button) {
  return Container(
    decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(255, 143, 158, 1),
            Color.fromRGBO(255, 188, 143, 1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xffee8262),
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ]),
        child: Center(
          child: GestureDetector(
            onTap: (){},
            child: button,),
        ),
  );
}
