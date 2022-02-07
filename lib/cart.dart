import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giaodien/routes/API/APIgiohanng.dart';
import 'package:giaodien/routes/models/account.dart';
import 'package:giaodien/routes/models/giohang.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  final List<Account> acc;
  const CartScreen({Key? key, required this.acc}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class chk {
  String? title;
  bool? value;

  chk({required this.title, this.value = false});
}

Widget buildBtn() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.all(5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xc6ff7f50),
            Color(0x40ee6a50),
          ],
        ),
      ),
      child: FlatButton(
        child: const Text(
          'Đặt hàng',
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Righteous',
            fontWeight: FontWeight.w600,
          ),
        ),
        textColor: Colors.black87,
        color: Colors.transparent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: () => print('Đặt hàng'),
      ),
    ),
  );
}

class _CartScreenState extends State<CartScreen> {
  final notication_first = chk(title: 'Tất cả');
  final notification_second = chk(title: 'Lựa chọn');

  void tonleGroupCheckbox(bool? value) {
    if (value == null) return;
    setState(() {
      notication_first.value = value;
      notification_second.value = value;
    });
  }

  Widget buildCheckbox(chk checkbox) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: checkbox.value,
      title: Text(
        checkbox.title.toString(),
      ),
      onChanged: (value) {
        setState(() {
          checkbox.value = value;
          notication_first.value = notification_second.value;
        });
      },
    );
  }

  Widget buildGroupCheckbox(chk checkbox) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: checkbox.value,
      title: Text(
        checkbox.title.toString(),
      ),
      onChanged: tonleGroupCheckbox,
    );
  }

  Widget quatity(String a) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            color: Color(0xc6ff7f50),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Icon(
            Icons.remove,
            color: Colors.white,
            size: 15.0,
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        Text(
          a,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            color: Color(0xc6ff7f50),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 15.0,
          ),
        ),
      ],
    );
  }

  Widget content(List<GioHang> giohang) {
    return Wrap(
        children: List.generate(giohang.length, (index) {
      String link =
          'http://10.0.2.2:8000/storage/' + giohang[index].hinh_anh;
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(children: [
            buildCheckbox(notification_second),
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
                  quatity(giohang[index].so_luong_mua.toString()),
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
              )
            ]),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xc6ff7f50),
                      Color(0x40ee6a50),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    var list = Provider.of<LayGioHangProvider>(context, listen: false);
    list.laygiohang(widget.acc[0].id);
    List<GioHang> giohang = list.giohang;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffe59191),
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
                            buildGroupCheckbox(notication_first),
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
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 485),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                        border: Border(
                            top: BorderSide(color: Colors.black45, width: 1))),
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0)),
                        Text(
                          'Tổng tiền',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0)),
                        Text(
                          '123,000 vnđ',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0)),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            gradient: const LinearGradient(
                              // Where the linear gradient begins and ends
                              begin: Alignment.topLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xc6ff7f50),
                                Color(0x40ee6a50),
                              ],
                            ),
                          ),
                          child: FlatButton(
                            child: const Text(
                              'Đặt hàng',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Righteous',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            textColor: Colors.black87,
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/pay');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
