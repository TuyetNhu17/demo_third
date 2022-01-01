

import 'package:flutter/material.dart';
import 'package:giaodien/Element/colorbutton.dart';
import 'Element/textfield.dart';
import 'Element/General.dart';
import 'Element/Titile.dart';


enum sex { nam, nu }
sex _sex = sex.nam;

class SignupSreen extends StatefulWidget {
  const SignupSreen({Key? key}) : super(key: key);

  @override
  Signup createState() => Signup();
}

class Signup extends State<SignupSreen> {
  Column radio(String a, sex gioitinh) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioListTile<sex>(
          contentPadding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          title: Text(a),
          value: gioitinh,
          groupValue: _sex,
          onChanged: (sex? value) {
            setState(() {
              _sex = value!;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TitleAppBar('Đăng kí'),
          backgroundColor: Color(0xffe59191),
        ),
        body: background(ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.asset(
                                'images/logo.jpg',
                                width: 250,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              form("Tên đăng nhập", Icons.account_circle,
                                  TextInputType.text, false),
                              const SizedBox(
                                height: 10,
                              ),
                              form("Email", Icons.email, TextInputType.text,
                                  false),
                              const SizedBox(
                                height: 10,
                              ),
                              form("Mật khẩu", Icons.password,
                                  TextInputType.text, true),
                              const SizedBox(
                                height: 10,
                              ),
                              form("Nhập lại mật khẩu", Icons.password,
                                  TextInputType.text, true),
                              const SizedBox(
                                height: 10,
                              ),
                              form("Số điện thoại", Icons.phone,
                                  TextInputType.number, false),
                              const SizedBox(
                                height: 10,
                              ),
                              form("Địa chỉ", Icons.home, TextInputType.text,
                                  false),
                              const SizedBox(
                                height: 10,
                              ),
                              form("Ngày sinh", Icons.cake,
                                  TextInputType.datetime, false),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: radio("Nam", sex.nam),
                                  ),
                                  Expanded(
                                    child: radio("Nữ", sex.nu),
                                  ),
                                ],
                              ),
                              colorbutton(FlatButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/second');
                                },
                                child: const Text(
                                  "Tạo tài khoản",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              )),
                            ],
                          ),
                        ],
                      ), context)
                );
  }
}
