import 'package:flutter/material.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/Element/Titile.dart';

List<int> text = [1, 2, 3, 4];

class InvoiceDetail extends StatelessWidget {
  const InvoiceDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar('Thông tin đơn hàng'),
        backgroundColor: Color(0xffe59191),
      ),
      body: background(
          ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: Text(
                      'Người bán đang chuẩn bị hàng/đang giao..',
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.place,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Địa chỉ giao hàng',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Text(
                              'Tên user',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black54),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Text(
                      'Địa chỉiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  for (var i in text)
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(children: [
                          SizedBox(
                            height: 5,
                          ),
                          Row(children: [
                            Image.asset('images/camtumixrose.jpg',
                                width: 100, height: 100),
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
                            height: 5,
                          )
                        ])),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border(top: BorderSide(color: Colors.black45))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Thành tiền',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '4083204812',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Mã đơn hàng',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange,
                                ),),
                                SizedBox(width: 60,),
                            Text(
                              'dabndkbladb',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                              ),
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Text('Thời gian đặt hàng',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange,
                                ),),
                                SizedBox(width: 60,),
                            Text(
                              'dabndkbladb',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                              ),
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Thời gian giao hàng',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange,
                                ),),
                                SizedBox(width: 60,),
                            Text(
                              'dabndkbladb',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                              ),
                              textAlign: TextAlign.end,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          context),
    );
  }
}
