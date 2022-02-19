import 'package:flutter/material.dart';
import '../../Element/General.dart';
import '../../Element/Titile.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  ChangePass createState() => ChangePass();
}

class ChangePass extends State<ChangePassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TitleAppBar('Đổi mật khẩu'),
          backgroundColor: Color(0xffe59191),
        ),
        body: background(
            ListView(
              key: _formKey,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'images/logo.jpg',
                      width: 250,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    // form("Mật khẩu hiện tại", Icons.lock,
                    //     TextInputType.text, true),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // form("Mật khẩu mới", Icons.lock, TextInputType.text,
                    //     true),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // form("Nhập lại mật khẩu", Icons.lock,
                    //     TextInputType.text, true),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 130.0,
                      height: 43.0,
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
                      child: FlatButton(
                        height: 50,
                        minWidth: 340,
                        child: const Text(
                          'Đổi mật khẩu',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Righteous',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        textColor: Colors.black87,
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('Sucess');
                          } else {
                            print('Unsuccess');
                          }
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
            context));
  }
}
