import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giaodien/routes/home/home.dart';
import 'routes/API/APIaccount.dart';
import 'routes/models/account.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget{
   const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen>{

  bool _isLoading= false;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
   var _emailInvalid = false;
   var _emailErr = "Email không hợp lệ";

   var _passInvalid = false;
   var _passErr = "Mật khẩu không hợp lệ";

  Future Login() async
  {
    Map<String ,String > data ={
      '_email' : emailController.text,
      '_mat_khau'  : passController.text,
    };
    List<Account> res = await login(data);
    if( res.length !=0)
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(account: res)));
      
    }
    else
    {
      print("Khong thanh cong");
    }
  }

  Widget buildUser(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0,2)
              ),
            ],
          ),
          height: 60,
          child: TextField(
            controller: emailController,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.account_circle,
                color: Color(0xffe59191),
              ),
              hintText: 'Email',    
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
              errorText: _emailInvalid ? _emailErr : null,
              errorStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPass(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mật khẩu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0,2)
              ),
            ],
          ),
          height: 60,
          child: TextField(
            controller: passController,
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xffe59191),
              ),
              hintText: 'Mật khẩu',
              errorText: _passInvalid ? _passErr : null,
              errorStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget  buildForgotPassBtn(){
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => print('Quên mật khẩu'),
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'Quên mật khẩu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget buildLoginBtn(BuildContext context, String mess){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          Check();
          Login();
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color(0xffe59191),
        child: Text(
          mess,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

    Widget buildSignUpBtn(BuildContext context, String mess, String route){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          Login();
          Navigator.pushNamed(context, route);
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color(0xffe59191),
        child: Text(
          mess,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffe59191),
                      Color(0x99e59191),
                      Color(0x66e59191),
                     
                    ]
                  ), 
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 70,
                  ),
                  child:_isLoading ? Center(child: CircularProgressIndicator()): Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/logo.png',
                      height: 100,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    buildUser(),
                    SizedBox(
                      height: 20,
                    ),
                    buildPass(),
                    buildForgotPassBtn(),
                    buildLoginBtn(context,'Đăng nhập'),
                    SizedBox(
                      height: 5,
                    ),
                    buildSignUpBtn(context,'Đăng ký','/signup'),
                  ],
                ),
                ),
              ),
            ],
          ),
        ), 
      ),
    );
  }

  void Check(){
    setState(() {
    if(emailController.text.length < 8 )
    {
      _emailInvalid = true;
    }
    else
    {
      _emailInvalid = false;
    }

    if(passController.text.length < 5 )
    {
      _passInvalid = true;
    }
    else
    {
      _passInvalid = false;
    }
  });
  }
}