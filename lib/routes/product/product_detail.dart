import 'package:flutter/material.dart';
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
    color: Colors.pink.withOpacity(0.5),
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
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                ),
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
            child: Container(
              height: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    boxShadow2,
                  ],
                  image: DecorationImage(
                      image: AssetImage(widget.product.imageUrl),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        decri('Tên sản phẩm:   ', widget.product.name),
        const SizedBox(
          height: 30,
        ),
        decri('Giá:   ', '${widget.product.price}  VNĐ'),
        const SizedBox(
          height: 30,
        ),
        containerSoLuong,
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30,bottom: 80),
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
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink[100],
                    boxShadow: [boxShadow2]),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  widget.product.description,
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
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: const Text('Chi tiết sản phẩm'),
      ),
      body: listView,
      // ignore: avoid_unnecessary_containers
      bottomSheet: 
       
      Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          Container(
        height: 50,
        width: 103,
        decoration:const BoxDecoration(
          
        ),
        // ignore: deprecated_member_use
        child: FlatButton(
          color: Colors.green[700],
          onPressed: () {},
          child: const Icon(Icons.shopping_cart,size: 30,color: Colors.white,
           
          )
        ),
      ),
      Container(
        height: 50,
        width: 308,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70)
        ),
        // ignore: deprecated_member_use
        child: FlatButton(
          color: Colors.red[800],
          onPressed: () {},
          
          child: const Text('Mua ngay',
          
          style:TextStyle(
            color: Colors.white,
           fontFamily: 'Times New Roman',
            fontSize: 20
          
          ),
          
          
          ),
        ),
      ),

        ],
      )
    );
  }
}
