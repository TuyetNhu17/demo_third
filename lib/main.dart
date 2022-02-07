import 'package:flutter/material.dart';
import 'package:giaodien/InvoiceDetail.dart';
import 'package:giaodien/SanPham.dart';
import 'package:giaodien/Signup.dart';
import 'package:giaodien/Review.dart';
import 'package:giaodien/ReviewForm.dart';
import 'package:giaodien/routes/API/APIproduct.dart';
import 'package:giaodien/routes/account/profile.dart';
import 'package:giaodien/routes/account/setting.dart';
import 'package:provider/provider.dart';
import 'package:giaodien/routes/screen_load/screen_load.dart';
import 'ForgotPass.dart';
import 'ChangePass.dart';
import 'Invoice.dart';
import 'package:giaodien/loginScreen.dart';
import 'package:giaodien/method_pay.dart';
import 'package:giaodien/pay.dart';
import 'package:giaodien/shopping_address.dart';
import 'routes/API/APIgiohanng.dart';

void main() {
 runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (context) => LaySanPhamProvider(),),
    ChangeNotifierProvider(create: (context) => LayGioHangProvider(),)
  ],
  child:  const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const ScreenLoad(),
        '/setting': (context) => const PageSetting(),
        '/profile': (context) => const PageProFile(),
        '/signup': (context) => const SignupSreen(),
        '/forgotpass': (context) => const ForgotPassScreen(),
        '/changepass': (context) => const ChangePassScreen(),
        '/review': (context) => const Review(),
        '/reviewform': (context) => const ReviewFormScreen(),
        '/invoice': (context) => const Invoice(),
        '/invoicedetail': (context) => const InvoiceDetail(),
        '/login': (context) => LoginScreen(),
        '/method_pay': (context) =>  MethodPayScreen(),
        '/pay': (context) => PayScreen(),
        '/shopping_address': (context) => ShoppingAddressScreen(),
        '/findproduct':(context)=> CustomSearch(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
