import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:giaodien/API/APIinvoice.dart';
import 'package:giaodien/screen/pay/pay.dart';
import 'package:giaodien/screen/product/product_banner.dart';
import 'package:giaodien/screen/search/search.dart';
import 'package:giaodien/screen/signup/Signup.dart';
import 'package:giaodien/screen/review/Review.dart';
import 'package:giaodien/screen/review/ReviewForm.dart';
import 'package:giaodien/screen/account/myhome.dart';
import 'package:giaodien/screen/account/profile.dart';
import 'package:giaodien/screen/account/setting.dart';
import 'package:provider/provider.dart';
import 'API/APIgiohanng.dart';
import 'API/APIproduct.dart';
import 'screen/account/ForgotPass.dart';
import 'screen/account/ChangePass.dart';
import 'package:giaodien/screen/login/loginScreen.dart';
import 'package:giaodien/screen/pay/shopping_address.dart';
import 'package:giaodien/screen/account/setting_account.dart';
import 'package:giaodien/screen/cart/done.dart';
import 'screen/home/home.dart';
import 'screen/invoice/Invoice.dart';
import 'screen/pay/method_pay.dart';
import 'screen/screen_load/screen_load.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LaySanPhamProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LayGioHangProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LayDonHangProvider(),
      )
    ],
    child: const MyApp(),
  ));
  configLoading();
}
 void configLoading() {
      EasyLoading.instance
        ..displayDuration = const Duration(milliseconds: 1000)
        ..indicatorType = EasyLoadingIndicatorType.fadingCircle
        ..loadingStyle = EasyLoadingStyle.dark
        ..indicatorSize = 45.0
        ..radius = 10.0
        ..progressColor = Colors.yellow
        ..backgroundColor = Colors.green
        ..indicatorColor = Colors.yellow
        ..textColor = Colors.yellow
        ..maskColor = Colors.blue.withOpacity(0.5)
        ..userInteractions = true
        ..dismissOnTap = false;
    }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const ScreenLoad(),
        '/second': (context) => const Home(
              account: [],
            ),
        '/myhome': (context) => const MyHome(
              account: [],
            ),
        '/setting': (context) => const PageSetting(),
        '/profile': (context) => const PageProFile(),
        '/signup': (context) => const SignupSreen(),
        '/forgotpass': (context) => const ForgotPassScreen(),
        '/changepass': (context) => const ChangePassScreen(),
        '/review': (context) => const Review(),
        '/reviewform': (context) => const ReviewFormScreen(),
        '/invoice': (context) => Invoice(
              acc: [], donhang: [],
            ),
        '/login': (context) => LoginScreen(),
        '/method_pay': (context) => MethodPayScreen(),
        '/pay': (context) => const PayScreen(
              acc: [],
            ),
        '/shopping_address': (context) => ShoppingAddressScreen(),
        '/findproduct': (context) => CustomSearch(),
        '/search': (context) => SearchProduct(
              account: [],
            ),
        '/thietlap': (context) => ThietLapTK(
              account: [],
            ),
        '/done': (context) => DonePayScreen(
              acc: [],
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
