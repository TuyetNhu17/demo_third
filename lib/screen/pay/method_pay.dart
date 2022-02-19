import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodPayScreen extends StatefulWidget{

  @override
  _MethodPayScreenState createState() => _MethodPayScreenState();
}

Widget buildBtn(BuildContext context){
  return Container(
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
        'Xác nhận',
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
        Navigator.pop(context);
      },
    ),
  );
}

enum _method {a,b}
_method method = _method.a;


class _MethodPayScreenState extends State<MethodPayScreen>{

  Column radio(String mess, _method phuongThuc){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioListTile <_method>(
          contentPadding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          title: Text(mess),
          value: phuongThuc, 
          groupValue: method, 
          onChanged: (_method? value){
            setState(() {
              method = value!;
            });
          }
        ),
      ],
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
                    vertical: 250,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: radio('Thanh toán khi nhận hàng', _method.a),
                            ),
                          ],
                        ),
                        buildBtn(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ), 
      ),
    );
  }
}