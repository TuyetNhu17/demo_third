import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giaodien/API/APIgiohanng.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/models/account.dart';
import 'package:giaodien/models/giohang.dart';
import 'package:giaodien/screen/pay/pay.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  final List<Account> acc;
  const CartScreen({Key? key, required this.acc}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _quatity = 1;
  Widget quatity(String a) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        CartCounter(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var list = Provider.of<LayGioHangProvider>(context, listen: false);
    list.laygiohang(widget.acc[0].id);
    List<GioHang> giohang = list.giohang;

    int tong = 0;
    for(var cart in giohang){
      tong = tong + (cart.don_gia * cart.so_luong_mua);
    }

    xoa(int id) async {
      var res = await xoagiohang(id);
      if (res == 'Success') {
        list.laygiohang(widget.acc[0].id);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => CartScreen(
                      acc: widget.acc,
                    )));
      }
    }

  show(){
      return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Hãy thêm sản phẩm vào giỏ hàng nhé!',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
        textAlign: TextAlign.center,),
        content: Image.asset('images/pic.gif',width: 350, height: 150,),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),),
          ),
        ],
        elevation: 24,
        backgroundColor: Color(0xA6e59191),
      ),
    );
    }

  updatesoluong(int id, int update) async {
    Map<String, int> data = {
      '_id': id,
      '_update': update,
    };
    var res = await chinhsoluong(data);
    if (res == 'Success') {
      list.laygiohang(widget.acc[0].id);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => CartScreen(
                    acc: widget.acc,
                  )));
    }
  }


    capnhatsoluong(int soluongsp, int id) {
    int soluong = soluongsp;
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 32,
          child: OutlineButton(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            onPressed: () {
              updatesoluong(id, 0);
            },
            child: Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            soluong.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          width: 40,
          height: 32,
          child: OutlineButton(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            onPressed: () {
              updatesoluong(id, 1);
            },
            child: Icon(Icons.add),
          ),
        )
      ],
    );
  }

    Widget content(List<GioHang> giohang) {
    return Wrap(
        children: List.generate(giohang.length, (index) {
      String link = 'http://10.0.2.2:8000/storage/' + giohang[index].hinh_anh;
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(children: [
            Padding(padding: EdgeInsets.only(bottom: 0)),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 100,
                width: 100,
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
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 3.0)),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 250),
                    child: Text(
                      giohang[index].ten_san_pham,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 1,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  capnhatsoluong(
                      giohang[index].so_luong_mua, giohang[index].id),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    giohang[index].don_gia.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              FlatButton(
                  onPressed: () {
                    xoa(giohang[index].id);
                    print('object');
                  },
                  child: Icon(Icons.delete_outline))
            ]),
          ]),
        ),
      );
    }));
  }  

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffe59191),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Tất cả'),
                Tab(text: 'Giảm giá'),
                Tab(text: 'Mua lại'),
              ],
            ),
            title: Text('Giỏ hàng'),
            centerTitle: true,
          ),
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffe59191),
                            Color(0x99e59191),
                            Color(0x66e59191),
                          ]),
                    ),
                    child: TabBarView(
                      children: [
                        ListView(
                          children: [
                            Column(
                              children: [
                                FutureBuilder(
                                  future: list.laygiohang(widget.acc[0].id),
                                  builder: (BuildContext context,
                                      AsyncSnapshot abc) {
                                    return content(giohang);
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(Icons.catching_pokemon),
                        Icon(Icons.catching_pokemon),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 50,
            child: Row(children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        "Thành tiền:",
                        style: TextStyle(
                            color: Color(0xffe59191),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        tong.toString() + 'VND',
                        style: TextStyle(
                            color: Color(0xffe59191),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  if(tong != 0){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PayScreen(acc: widget.acc)));
                  }
                  else{
                    show();
                  }
                  
                },
                child: const Text("Thanh Toán"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffe59191)),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
