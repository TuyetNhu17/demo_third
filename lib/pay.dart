import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PayScreen extends StatefulWidget {
  @override
  _PayScreenState createState() => _PayScreenState();
}

Widget buildAddress() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Địa chỉ nhận hàng',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Container(
        alignment: Alignment.centerLeft,
        height: 30,
        child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            hintText: 'Huỳnh Thúc Kháng, Quận 1',
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildSum() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Tổng tiền',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Container(
        alignment: Alignment.centerLeft,
        height: 30,
        child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            hintText: '193,500 vnđ',
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildMethodPay(BuildContext context) {
  return Row(
    //crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        'Phương thức thanh toán',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Container(
        alignment: Alignment.centerRight,
        height: 25,
        decoration: BoxDecoration(
          color: Color(0xffe59191),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
          ],
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.pushNamed(context, '/method_pay');
          },
          padding: EdgeInsets.only(right: 5),
        ),
      ),
    ],
  );
}

Widget buildAll() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Tổng tiền hàng',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Container(
        alignment: Alignment.centerLeft,
        height: 25,
        padding: EdgeInsets.only(right: 5),
        child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            hintText: 'Số tiền',
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildTransport() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Tổng vận chuyển',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Container(
        alignment: Alignment.centerLeft,
        height: 25,
        padding: EdgeInsets.only(right: 5),
        child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            hintText: 'Số tiền',
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildBill() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Tổng thanh toán',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Container(
        alignment: Alignment.centerLeft,
        height: 25,
        padding: EdgeInsets.only(right: 5),
        child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            hintText: 'Số tiền',
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildDoneBtn(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5,
      onPressed: () {
        Navigator.pushNamed(context, '/method_pay');
      },
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Color(0xffe59191),
      child: Text(
        'Đặt hàng',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh toán'),
        backgroundColor: Color(0xcce59191),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
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
                      ]),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildAddress(),
                      SizedBox(
                        height: 20,
                      ),
                      buildSum(),
                      SizedBox(
                        height: 30,
                      ),
                      buildMethodPay(context),
                      SizedBox(
                        height: 40,
                      ),
                      buildAll(),
                      SizedBox(
                        height: 20,
                      ),
                      buildTransport(),
                      SizedBox(
                        height: 20,
                      ),
                      buildBill(),
                      buildDoneBtn(context),
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
}
