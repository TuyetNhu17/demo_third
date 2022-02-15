import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/SanPham.dart';
import 'package:giaodien/cart.dart';
import 'package:giaodien/routes/API/APIgiohanng.dart';
import 'package:giaodien/routes/API/APIproduct.dart';
import 'package:giaodien/routes/models/product.dart';
import 'package:giaodien/routes/product/product.dart';
import 'package:giaodien/routes/product/product_detail.dart';
import 'package:provider/provider.dart';
import '../models/banner.dart';
import '../models/account.dart';
import 'package:giaodien/setting_account.dart';

class Home extends StatefulWidget {
  final List<Account> account;
  const Home({Key? key, required this.account}) : super(key: key);
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> with SingleTickerProviderStateMixin {
  Future<List<Product>> list = SanPhamTrangChu();
  

  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _movieSelector(int index) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (BuildContext context, Widget? widget) {
          double value = 1;
          if (_pageController.position.haveDimensions) {
            value = (_pageController.page! - index);
            value = (1 - (value.abs() * 0.3) + 0.06).clamp(0, 1);
          }
          return Center(
            child: SizedBox(
              height: Curves.easeInOut.transform(value) * 170,
              width: Curves.easeInOut.transform(value) * 400,
              child: widget,
            ),
          );
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Stack(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      SanPham(id: banner[index].id,acc: widget.account,)));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage(banner[index].imgurl),
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var sanphamapi = Provider.of<LaySanPhamProvider>(context, listen: false);
    sanphamapi.LaySanPham();
    var giohangapi = Provider.of<LayGioHangProvider>(context, listen: false);
   giohangapi.laygiohang(widget.account[0].id);
    var _container = Container(
      height: 230,
      child: PageView.builder(
        controller: _pageController,
        itemCount: banner.length,
        itemBuilder: (BuildContext context, int index) {
          return _movieSelector(index);
        },
      ),
    );

    var sanpham = Container(
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
      child: const Center(
        child: Text(
          'Sản phẩm',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Times New Roman",
            color: Colors.white,
          ),
        ),
      ),
    );

    wrap(AsyncSnapshot abc) {
      return Wrap(
        children: List.generate(abc.data.length, (index) {
          String link =
              'http://10.0.2.2:8000/storage/' + abc.data[index].hinh_anh;
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => PageDetail(product: abc.data[index],acc: widget.account,)));
            },
            child: Card(
              color: Color(0xffe59191),
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: ClipOval(
                        child: Container(
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: link,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.black12,
                        ),
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    abc.data[index].ten_san_pham,
                    style: const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      );
    }

    var listView = ListView(children: [
      _container,
      sanpham,
      Center(
        child: FutureBuilder<List<Product>>(
          future: list,
          builder: (context, abc) {
            if (abc.hasData) {
              return wrap(abc);
            } else if (abc.hasError) {
              return Text("${abc.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      Container(
          alignment: Alignment.bottomRight,
          child: InkWell(
            child: const Text(
              'Xem tất cả >>',
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProductScreen(id: 0,acc: widget.account,)));
            },
          ))
    ]);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffe59191),
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Container(
            child: IconButton(
              
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: (){
                Navigator.pushNamed(context, '/search');
              },
              iconSize: 30,
              
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              iconSize: 30,
              color: Colors.white,
              splashColor: Colors.pink.shade200,
              onPressed: () { Navigator.push(
                  context,
                MaterialPageRoute(
                      builder: (_) => CartScreen(acc: widget.account,)));
              },
            ),
          ],
        ),
        body: background(listView, context),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Tôi'
            ),
          ],
          backgroundColor: Color(0xffe59191),
          selectedItemColor: Colors.white,
          currentIndex: 0,
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
      ),
    );
  }
}
