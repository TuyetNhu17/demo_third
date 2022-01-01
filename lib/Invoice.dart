import 'package:flutter/material.dart';
import 'Element/General.dart';
import 'Element/Titile.dart';
import 'Element/donhang.dart';
List<int> text = [1, 2, 3, 4];
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
void pri(){
  print('Hủy đơn');
}
class Invoice extends StatelessWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: TitleAppBar('Đơn mua'),
            backgroundColor: Color(0xffe59191),
            bottom: const TabBar(
              isScrollable:true,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Chờ xác nhận'),
                Tab(text: 'Chờ lấy hàng'),
                Tab(text: 'Đang giao'),
                Tab(text: 'Đã giao'),
                Tab(text: 'Đã hủy')
              ],
            ),
          ),
          body:background1(
              TabBarView(children: [
              ListView(children: [for (var i in text)Column(
                children: [ don('Hủy đơn',context),
                SizedBox(height: 15,),],
              )
              ]),
              ListView(children: [for (var i in text)Column(
                children: [ don('Hủy đơn',context),
                SizedBox(height: 15,),],
              )
              ]),
              ListView(children: [for (var i in text)Column(
                children: [ don('Hủy đơn',context),
                SizedBox(height: 15,),],
              )
              ]),
              ListView(children: [for (var i in text)Column(
                children: [ don('Đánh giá',context),
                SizedBox(height: 15,),],
              )
              ]),
              ListView(children: [for (var i in text)Column(
                children: [ don('Mua lại',context),
                SizedBox(height: 15,),],
              )
              ]),
            ]), context)
        )
        );
  }
}
