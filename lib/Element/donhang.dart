import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colorbutton.dart';
import 'decor.dart';

Widget don(String button,BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, '/invoicedetail');
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Row(children: [
          Image.asset('images/camtumixrose.jpg', width: 100, height: 100),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 300),
                child: Text(
                  'Hoa cẩm tú cầu và hoa hồnggggggggg',
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 1,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                'x1',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                '50.000d',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),
            ],
          )
        ]),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black45))),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '3 sản phẩm',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Thành tiền : 250000',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black45))),
          child: colorbutton(
            FlatButton(
              child: Text(
                button,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Righteous',
                  fontWeight: FontWeight.w600,
                ),
              ),
              textColor: Colors.black87,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () => print('aaaaaa'),
            ),
          ),
        ),
      ]),
    ),
  );
}
