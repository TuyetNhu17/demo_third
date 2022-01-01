import 'package:flutter/material.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/Element/Titile.dart';
List<int> text = [1, 2, 3, 4];
class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar('Đánh giá'),
        backgroundColor: Color(0xffe59191),
      ),
      body: background(
          ListView(
            padding: EdgeInsets.all(10),
            children: [
              for (var item in text)
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 40,
                            child: ClipOval(
                                child: Image.asset(
                              'images/avatar.png',
                            ))),
                            const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Tên user',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                      child: Text('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16
                      ),),
                    ),
                    Text('25/12/2021 15:30:00',
                    style: TextStyle(
                        fontSize: 16
                      ),)
                  ],
                ),
              )
            ],
          ),
          context),
    );
  }
}
