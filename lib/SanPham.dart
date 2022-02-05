import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/routes/product/category.dart';
import 'package:giaodien/routes/product/product_detail.dart';
import 'routes/API/APIproduct.dart';
import 'routes/models/product.dart';

class SanPham extends StatelessWidget {
  final int id;
  const SanPham({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Future<List<Product>> lstSanPham;
    if (id == 1) {
      lstSanPham = SanPhamBanChay();
    } else {
     lstSanPham = SanPhamMoi();
    }

    Widget listSanPham() {
      return ListView(
        children: [
          Center(
            child: FutureBuilder<List<Product>>(
              future: lstSanPham,
              builder: (context, abc) {
                if (abc.hasData) {
                  return sanpham(abc, context);
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

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffe59191),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/findproduct');
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  width: 340,
                  child: RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0),
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
                icon: Icon(
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
}

sanpham(AsyncSnapshot abc, BuildContext context) {
  return Wrap(
    children: List.generate(abc.data.length, (index) {
      String link = 'http://10.0.2.2:8000/storage/' + abc.data[index].hinh_anh;
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => PageDetail(product: abc.data[index])));
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

class CustomSearch extends StatefulWidget {
  const CustomSearch({Key? key}) : super(key: key);
  @override
  CustomSearchState createState() => CustomSearchState();
}

class CustomSearchState extends State<CustomSearch> {
  final _formKey = GlobalKey<FormState>();

  var _autoValidate = false;

  var key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffe59191),
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.pink,
                  ),
                ]),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                border: OutlineInputBorder(),
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  iconSize: 30,
                  color: Colors.black,
                  onPressed: () {},
                ),
                hintText: 'search',
                //suffixIcon: Icons.search,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            key = value;
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Nhập tên sản phẩm',
                            filled: true),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Vui lòng nhập tên sản phẩm';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: RawMaterialButton(
                            onPressed: () {
                              final isValid = _formKey.currentState!.validate();
                              if (isValid) {
                                // TimKiemSanPham(key);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Tìm kiếm'),
                            ),
                            fillColor: Colors.amber,
                          ))
                    ],
                  )),
            ],
          ),
        ));
  }
}
