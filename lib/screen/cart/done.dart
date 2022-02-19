import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giaodien/models/account.dart';

class DonePayScreen extends StatefulWidget{

  final List<Account> acc;
  const DonePayScreen({Key? key, required this.acc}) : super(key: key);
  @override
  _DonePayScreenState createState() => _DonePayScreenState();
}


class _DonePayScreenState extends State<DonePayScreen>{

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
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
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
                    vertical: 250,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.check_circle_outline),
                        SizedBox(height: 10,),
                        Text('Đơn đặt hàng thành công',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10,),
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