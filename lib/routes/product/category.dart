import 'package:flutter/material.dart';
import 'package:giaodien/routes/API/APIcatagory.dart';
import 'package:giaodien/routes/models/account.dart';
import 'package:giaodien/routes/models/catagory.dart';
import 'package:giaodien/routes/product/product.dart';

class drawerWidget extends StatelessWidget {
  final List<Account> acc;
  drawerWidget({Key? key, required this.acc}) : super(key: key);
  final padding = EdgeInsets.symmetric(horizontal: 15);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xE6e59191),
        child: ListView(
          padding: padding,
          children: [
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProductScreen(id: 0,acc: acc,)));
              },
              title: Text(
                'Tất cả',
                style: TextStyle(fontSize: 14),
              ),
              hoverColor: Colors.white,
            ),
            listSanPham()
          ],
        ),
      ),
    );
  }

  Widget loaisanpham(AsyncSnapshot abc, BuildContext context) {
    return Wrap(
        children: List.generate(abc.data.length, (index) {
      return ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ProductScreen(id: abc.data[index].id,acc: acc,)));
        },
        title: Text(
          abc.data[index].ten_loai,
          style: TextStyle(fontSize: 14),
        ),
        hoverColor: Colors.white,
      );
    }));
  }

  Future<List<Categori>> loaiSanPham = LayLoaiSanPham();

  Widget listSanPham() {
    return FutureBuilder<List<Categori>>(
      future: loaiSanPham,
      builder: (context, abc) {
        if (abc.hasData) {
          return loaisanpham(abc, context);
        } else if (abc.hasError) {
          return Text("${abc.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
