import 'package:flutter/material.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/Element/Titile.dart';
import 'package:giaodien/Element/colorbutton.dart';

class PageSetting extends StatefulWidget {
  const PageSetting({Key? key}) : super(key: key);
  @override
  Page createState() => Page();
}

class Page extends State<PageSetting> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
         title: TitleAppBar('Thiết lập tài khoản'),
          backgroundColor: Color(0xffe59191),
          ),
        body: background(ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color:Color(0xffe59191),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    offset: const Offset(0, 5),
                    blurRadius: 7,
                    spreadRadius: 3,
                  ),
                ],
              ),
              margin: const EdgeInsets.fromLTRB(10, 0, 250, 0),
              child: const Center(
                child: Text(
                  'Thông tin',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times New Roman",
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Hồ sơ của tui',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times New Roman",
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 50,
              width: 50,
              decoration: BoxDecoration(
                border:Border.all(
                  width: 1,
                  color: Colors.blueGrey,
                ) ,
                
                  //borderRadius: BorderRadius.circular(10),
              ),
              
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                  
                },
                icon: const Icon(Icons.arrow_forward_ios),
                iconSize: 25,
                splashColor: Color(0xffe59191),
                alignment: Alignment.center,
              ),
              padding: const EdgeInsets.only(left: 5),
            ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 20, 70, 20),
              child: colorbutton(FlatButton(onPressed: (){
              }, child: RichText(text: TextSpan(children: [
                WidgetSpan(child: Icon(Icons.logout,size: 32,)),
                TextSpan(text: 'Đăng xuất',style: TextStyle(fontSize: 28))
              ]))))
            ),
          ],
        ),context)
      ),
    );
  }
}
