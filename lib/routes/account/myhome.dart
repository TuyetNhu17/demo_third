import 'package:flutter/material.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/routes/home/home.dart';
import '../models/account.dart';
import 'package:giaodien/setting_account.dart';

class MyHome extends StatefulWidget {
  final List<Account> account;
  const MyHome({Key? key, required this.account}) : super(key: key);
  @override
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    container(String a) {
      return Container(
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xffe59191),
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
        child: Center(
          child: Text(
            a,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Times New Roman",
              color: Colors.blueGrey,
            ),
          ),
        ),
      );
    }

    row(String a, String b) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            a,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Times New Roman",
              color: Colors.white,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),

              //borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, b);
              },
              icon: const Icon(Icons.arrow_forward_ios),
              iconSize: 25,
              splashColor: Color(0xffe59191),
              alignment: Alignment.center,
              color: Colors.blueGrey,
            ),
            padding: const EdgeInsets.only(left: 5),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: background(
          ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xffe59191),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  ),
                  Positioned(
                    top: 50,
                    left: 120,
                    child: Text(
                      widget.account[0].ho_ten,
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 80,
                    left: 120,
                    child: Text(
                      'Thành Viên',
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 45,
                    right: 30,
                    child: IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                      ),
                      iconSize: 30,
                      color: Colors.blueGrey,
                      splashColor: Colors.orange,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              container('Đơn Hàng'),
              const SizedBox(height: 40),
              row('Xem lịch sử mua hàng', '/invoice'),
              const SizedBox(height: 40),
              container('Thông Tin'),
              const SizedBox(height: 40),
              row('Thiết lập tài khoản', '/setting'),
            ],
          ),
          context),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              // ignore: deprecated_member_use
              label: 'Tôi'),
        ],
        backgroundColor: Color(0xffe59191),
        selectedItemColor: Colors.white,
        currentIndex: 1,
        onTap: (index) {
          Navigator.push(
            context,
            PageRouteBuilder(pageBuilder: (context, animation, secon) {
              if (index == 0) {
                
                return Home(account: widget.account,);
              }
              if (index == 1) {
                
                return ThietLapTK(account: widget.account,);
              }
              return ThietLapTK(account: widget.account,);
            }),
          );
        },
      ),
    );
  }
}
