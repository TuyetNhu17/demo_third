import 'package:flutter/material.dart';
import 'package:giaodien/Element/Titile.dart';

class PageProFile extends StatefulWidget {
  const PageProFile({Key? key}) : super(key: key);
  @override
  Page createState() => Page();
}

class Page extends State<PageProFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
          title: TitleAppBar('Thông tin tài khoản'),
          backgroundColor: Color(0xffe59191),
        ),
//body:background(...,context),

    );

  }
}