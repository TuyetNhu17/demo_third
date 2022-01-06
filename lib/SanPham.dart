import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/Element/General.dart';

import 'routes/API/sanpham.dart';
import 'routes/models/product.dart';

class SanPham extends StatefulWidget {
  SanPham({Key? key}) : super(key: key);
  // SanPham({required this.idLoaisp}) : super();
  // final int idLoaisp;
  @override
  SanPhamTheoLoai createState() => SanPhamTheoLoai();
}

class SanPhamTheoLoai extends State<SanPham> {
  Future<List<Product>> lstSanPham = fetchPostSanPham();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffe59191),
            actions: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                width: 340,
                child: InkWell(
                  child: RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Icon(
                            Icons.search,
                            size: 25,
                            color: Color(0xffe59191),
                          ),
                        ),
                      ),
                      TextSpan(
                          text: 'Tìm kiếm sản phẩm',
                          style: TextStyle(
                              fontSize: 21, color: Color(0xffe59191))),
                    ]),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                iconSize: 30,
                color: Colors.white,
                splashColor: Colors.pink.shade200,
                onPressed: () {
                  Navigator.pushNamed(context, '/invoice');
                },
              ),
            ],
          ),
          // body: background(lb, context),
          body: background(listSanPham(), context),
        ));
  }

  Widget listSanPham() {
    return ListView(
      children: [
        Center(
          child: FutureBuilder<List<Product>>(
            future: lstSanPham,
            builder: (context, abc) {
              if (abc.hasData) {
                return sanpham(abc);
              } else if (abc.hasError) {
                return Text("${abc.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }

  sanpham(AsyncSnapshot abc) {
    return Wrap(
      children: List.generate(abc.data.length, (index) {
        String link =
            'http://10.0.2.2:8000/images/product/' + abc.data[index].hinh_anh;
        return InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (_) => PageDetail(product: abc.data[index])));
          },
          child: Card(
            color: Color(0xffe59191),
            elevation: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: 170,
                  width: 180,
                  child: ClipOval(
                      child: Container(
                    margin: EdgeInsets.all(15),
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
                  '${abc.data[index].ten_san_pham}',
                  style: const TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Giá:  ${abc.data[index].don_gia} VNĐ',
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
        );
      }),
    );
  }
}
