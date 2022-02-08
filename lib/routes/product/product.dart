import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/routes/API/APIproduct.dart';
import 'package:giaodien/routes/models/account.dart';
import 'package:giaodien/routes/models/product.dart';
import 'package:giaodien/routes/product/category.dart';
import 'package:giaodien/routes/product/product_detail.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final int id;
  final List<Account> acc;
  const ProductScreen({Key? key, required this.id,required this.acc}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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

    Widget cardsanpham() {
      return SizedBox(
        height: sanpham.length * 50,
        child: FutureBuilder(
            future: sanphamapi.LaySanPham(),
            builder: (context, AsyncSnapshot snapshot) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: sanpham.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  String link =
                      'http://10.0.2.2:8000/storage/' + sanpham[index].hinh_anh;
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  PageDetail(product: sanpham[index],acc: widget.acc)));
                    },
                    child: Card(
                      color: const Color(0xffe59191),
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
                  );
                },
              );
            }),
      );
    }

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          endDrawer: drawerWidget(acc: widget.acc,),
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Color(0xffe59191),
            title: Text('Sản phẩm'),
            centerTitle: true,
          ),
          body: background(cardsanpham(), context),
        ));
  }
}
