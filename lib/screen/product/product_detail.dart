import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:giaodien/API/APIgiohanng.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/Element/colorbutton.dart';
import 'package:giaodien/models/account.dart';
import 'package:giaodien/models/product.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PageDetail extends StatefulWidget {
  final Product product;
  final List<Account> acc;

  PageDetail({required this.product, required this.acc});

  @override
  Detail createState() => Detail();
}

class Detail extends State<PageDetail> {
  themGioHang() async {
    Map<String, String> data = {
      '_idsanpham': widget.product.id.toString(),
      '_idkhachhang': widget.acc[0].id.toString(),
      '_soluongmua': quality.toString()
    };
    var res = await themgiohang(data);

    var giohangapi = Provider.of<LayGioHangProvider>(context, listen: false);
    giohangapi.laygiohang(widget.acc[0].id);

  
     thongbao(res);
  }

  thongbao(mess) {
    var a;
    IconData icon;
    if (mess == 'Success') {
      a = 'Đã thêm vào giỏ';
      icon = Icons.task_alt;
    } else {
      a = 'Vượt quá số lượng tồn kho';
      icon = Icons.sentiment_dissatisfied;
    }

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: RichText(
                textAlign: TextAlign.center,
                  text: WidgetSpan(
                child: Icon(
                  icon,
                  size: 25,
                ),
              )),
              content: Text(a),
              backgroundColor: Colors.white,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Xong'))
              ],
            ));
    
  //   // return Fluttertoast.showToast(
  //   //     msg: a,
  //   //     fontSize: 20,
  //   //     toastLength: Toast.LENGTH_LONG,
  //   //     gravity: ToastGravity.CENTER,
  //   //     backgroundColor: Colors.white,
  //   //     textColor: Colors.black54,
  //   //     timeInSecForIosWeb: 2);
  }

  var quality = 1;

  var boxShadow2 = BoxShadow(
    offset: const Offset(1, 3),
    blurRadius: 4,
    spreadRadius: 1,
  );

  decri(String a, String b) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 40,
                width: 150,
              ),
              Positioned(
                top: 10,
                child: Text(
                  a,
                  style: const TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [boxShadow2],
                ),
                height: 40,
                width: 150,
              ),
              Positioned(
                top: 10,
                left: 25,
                child: Text(
                  b,
                  style: const TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var containerSoLuong = Container(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Số Lượng: ',
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 60,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [boxShadow2]),
            height: 30,
            width: 30,
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (quality > 1) {
                    quality--;
                  }
                });
              },
              icon: const Icon(Icons.remove),
              iconSize: 15,
              splashColor: Colors.pink[200],
            ),
            margin: const EdgeInsets.only(left: 15, right: 15),
          ),
          Text(
            '$quality',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          //const SizedBox(width: 10,),
          Container(
            decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [boxShadow2]),
            height: 30,
            width: 30,
            child: IconButton(
              onPressed: () {
                setState(() {
                  quality++;
                });
              },
              icon: const Icon(Icons.add),
              iconSize: 15,
              splashColor: Colors.pink[200],
            ),
            margin: const EdgeInsets.only(left: 15, right: 15),
          ),
        ],
      ),
    );
    var listView = ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Card(
          elevation: 0,
          child: Hero(
            tag: widget.product.id.toString(),
            child: SizedBox(
              height: 170,
              width: 180,
              child: Container(
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                      'http://10.0.2.2:8000/storage/' + widget.product.hinh_anh,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        decri('Tên sản phẩm:   ', widget.product.ten_san_pham),
        const SizedBox(
          height: 30,
        ),
        decri('Giá:   ',NumberFormat.decimalPattern().format( widget.product.don_gia)+' VND'),
        const SizedBox(
          height: 30,
        ),
        containerSoLuong,
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Mô Tả: ',
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Flexible(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [boxShadow2]),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  widget.product.mo_ta,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
            ],
          ),
        ),
      ],
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffe59191),
          title: const Text('Chi tiết sản phẩm'),
        ),
        body: background(listView, context),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 308,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(70)),
              child: colorbutton(
                FlatButton(
                  onPressed: () async{
                    themGioHang();
                  },
                  child: const Text(
                    'Thêm vào giỏ hàng',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Times New Roman',
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
