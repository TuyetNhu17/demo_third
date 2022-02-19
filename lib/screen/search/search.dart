import 'dart:async';
import 'package:giaodien/API/APIproduct.dart';
import 'package:giaodien/models/account.dart';
import 'package:giaodien/models/product.dart';
import 'package:giaodien/screen/product/product_detail.dart';

import '../search/search_widget.dart';
import 'package:flutter/material.dart';

class SearchProduct extends StatefulWidget {
  final List<Account> account;
  const SearchProduct({Key? key, required this.account}) : super(key: key);
  @override
  _SearchProduct createState() => _SearchProduct();
}

class _SearchProduct extends State<SearchProduct> {
  List<Product> products = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final products = await fetchSearch(query);

    setState(() => this.products = products);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Search"),
          centerTitle: true,
          backgroundColor: Color(0xffe59191),
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return buildProduct(product);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Bạn cần tìm gì?',
        onChanged: searchProduct,
      );

  Future searchProduct(String query) async => debounce(() async {
        final products = await fetchSearch(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.products = products;
        });
      });

  Widget buildProduct(Product product) => ListTile(
    tileColor: Color(0xffe59191),
        title: Text(product.ten_san_pham),
        subtitle: Text(product.mo_ta),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageDetail(product: product,acc: widget.account,)));
        },
      );
}
