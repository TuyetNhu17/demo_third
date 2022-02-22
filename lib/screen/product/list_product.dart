import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/API/APIproduct.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/models/account.dart';
import 'package:giaodien/models/product.dart';
import 'package:giaodien/screen/home/home.dart';
import 'package:giaodien/screen/product/product_detail.dart';
import 'package:provider/provider.dart';

import 'category.dart';

class ProductScreen extends StatefulWidget {
  final int id;
  final List<Account> acc;
  const ProductScreen({Key? key, required this.id, required this.acc})
      : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String _sapxep = 'Sắp xếp';
  int sapxep = 0;

  @override
  Widget build(BuildContext context) {
    var sanphamapi = Provider.of<LaySanPhamProvider>(context, listen: false);
    List<Product> sanpham = [];
    if (widget.id == 0) {
      sanpham = sanphamapi.sanphams;
    } else {
      for (var i in sanphamapi.sanphams) {
        if (i.loai_san_pham_id == widget.id) {
          sanpham.add(i);
        }
      }
    }
    if (sapxep == 3) {
      sanpham.sort((a, b) => a.ten_san_pham.compareTo(b.ten_san_pham));
    } else if(sapxep==4){
      sanpham.sort((a, b) => b.ten_san_pham.compareTo(a.ten_san_pham));
    }else if(sapxep==1){
      sanpham.sort((a, b) => b.don_gia.compareTo(a.don_gia));
    }else if(sapxep==2){
      sanpham.sort((a, b) => a.don_gia.compareTo(b.don_gia));
    }

    Widget popupSort() {
      return PopupMenuButton(
          itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  child: Text('Giá giảm dần'),
                  onTap: () {
                    
                    setState(() {
                      _sapxep = 'Giá giảm dần';
                      sapxep = 1;
                    });
                  },
                ),
                PopupMenuItem(
                    child: Text('Giá tăng dần'),
                    onTap: () {
                      setState(() {
                        _sapxep = 'Giá tăng dần';
                        sapxep = 2;
                      });
                    }),
                PopupMenuItem(
                  child: Text('A-Z'),
                  onTap: () {
                    setState(() {
                      _sapxep = 'A-Z';
                      sapxep = 3;
                    });
                  },
                ),
                PopupMenuItem(
                  child: Text('Z-A'),
                  onTap: () {
                    setState(() {
                      _sapxep = 'Z-A';
                      sapxep = 4;
                    });
                  },
                ),
              ]);
    }

    Widget cardsanpham() {
      return ListView(children: [
        Row(
          children: [
            Container(
              child: Text(
                _sapxep,
                style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15),
              ),
              height: 30,
              width: 100,
              margin: EdgeInsets.only(top: 10, left: 10),
            ),
            popupSort()
          ],
        ),
        FutureBuilder(
            future: sanphamapi.LaySanPham(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }else{
          return cardsp(sanpham);
        }
              
            }),
      ]);
    }

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          endDrawer: drawerWidget(
            acc: widget.acc,
          ),
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Home(
                                account: widget.acc,
                              )));
                }),
            backgroundColor: Color(0xffe59191),
            title: Text('Sản phẩm'),
            centerTitle: true,
          ),
          body: background(cardsanpham(), context),
        ));
  }

  cardsp(sanpham) {
    return Wrap(
        children: List.generate(
      sanpham.length,
      (index) {
        String link = 'http://10.0.2.2:8000/storage/' + sanpham[index].hinh_anh;
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        PageDetail(product: sanpham[index], acc: widget.acc)));
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Card(
              color: const Color(0xffe59191),
              elevation: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 170,
                    width: 180,
                    child: ClipOval(
                        child: Container(
                      margin: const EdgeInsets.all(15),
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
                  Text(
                    '${sanpham[index].ten_san_pham}',
                    style: const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Giá:  ${sanpham[index].don_gia} VNĐ',
                    style: const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
