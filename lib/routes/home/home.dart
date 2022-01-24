import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/SanPham.dart';
import 'package:giaodien/routes/API/APIcatagory.dart';
import 'package:giaodien/routes/models/catagory.dart';
import '../models/banner.dart';
import '../account/myhome.dart';
import '../models/account.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> with SingleTickerProviderStateMixin {
  Future<List<LoaiSanPham>> list = fetchLoaiSanPham();

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
                      child: Hero(
                        tag: banner[index].imgurl,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage(banner[index].imgurl),
                            height: 200,
                            fit: BoxFit.cover,
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
    // ignore: sized_box_for_whitespace
    var _container = Container(
      height: 230,
      //width: double.infinity,
      child: PageView.builder(
        controller: _pageController,
        itemCount: banner.length,
        itemBuilder: (BuildContext context, int index) {
          return _movieSelector(index);
        },
      ),
    );

    //hiện ra các chủ để trong danh mục
    // ignore: non_constant_identifier_names
    var containerchude = Container(
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
          'Danh Mục',
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
          String link = 'http://10.0.2.2:8000/images/catagory/' +
              abc.data[index].hinh_anh;
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SanPham(idloaisp: abc.data[index].id)));
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
                    abc.data[index].ten_loai,
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
      containerchude,
      Center(
        child: FutureBuilder<List<LoaiSanPham>>(
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
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.pink,
                  ),
                ]),
            child: IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: (){
                Navigator.pushNamed(context, '/search');
              },
              iconSize: 50,
              
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
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
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
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tôi'),
          ],
          backgroundColor: Color(0xffe59191),
          selectedItemColor: Colors.white,
          currentIndex: 0,
          onTap: (index) {
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (context, animation, secon) {
                if (index == 0) {
                  return const Home();
                }
                if (index == 1) {
                  return const MyHome();
                }
                return const MyHome();
              }),
            );
          },
        ),
      ),
    );
  }
}
