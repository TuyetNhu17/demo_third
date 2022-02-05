import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/Element/colorbutton.dart';
import '../models/product.dart';

class PageDetail extends StatefulWidget {
  final Product product;

  // ignore: use_key_in_widget_constructors
  const PageDetail({required this.product});

  @override
  Detail createState() => Detail();
}

class Detail extends State<PageDetail> {
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
                  imageUrl: 'http://10.0.2.2:8000/storage/' +
                      widget.product.hinh_anh,
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
        decri('Giá:   ', '${widget.product.don_gia}  VNĐ'),
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
                  color:Colors.pink[100] ,
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
        // ignore: avoid_unnecessary_containers
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 103,
              decoration: const BoxDecoration(),
              child: colorbutton(
                FlatButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: Colors.white,
                    )),
              ),
            ),
            Container(
              height: 50,
              width: 308,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(70)),
              child: colorbutton(
                FlatButton(
                  onPressed: () {},
                  child: const Text(
                    'Mua ngay',
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
