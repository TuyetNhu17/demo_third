import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/API/APIgiohanng.dart';
import 'package:giaodien/models/account.dart';
import 'package:giaodien/models/giohang.dart';
import 'package:provider/provider.dart';

class Info extends StatefulWidget{
  final int tongTien;
  final List<Account> taiKhoan;
  const Info({Key? key, required this.tongTien, required this.taiKhoan}) : super(key: key);
  @override
  _Info createState() => _Info();
}

class _Info extends State<Info> {
  @override
  Widget build(BuildContext context) {
    var list = Provider.of<LayGioHangProvider>(context, listen: false);
    list.laygiohang(widget.taiKhoan[0].email);
    List giohang = list.giohang;
    
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        SizedBox(height: 5,),
        buildAddressContainer(size , context),
        SizedBox(height: 10),
        Container(
          width:  size.width,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xA6e59191),
            border: Border.all(color: Color(0x80e59191).withOpacity(0.7) , width: 2),
          ),
          child: Center(
            child: Text(
              "Chi tiết đơn hàng",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: giohang.length,
              itemBuilder: (context , index ) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: DetailOrderItem(cart: giohang[index]),
              ),

            ),
          ),   
      ],
    );
  }

  Container buildAddressContainer(Size size , BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0x80e59191), width: 2 ),
      ),
        width: size.width,
        height: 90,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.supervised_user_circle,
                        size: 15,
                      ),
                      SizedBox(width: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: Text(
                          "Họ và tên:     "+ widget.taiKhoan[0].ho_ten,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.maps_home_work,
                        size: 15,
                      ),
                      SizedBox(width: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: Text(
                          "Địa chỉ nhận hàng:    "+ widget.taiKhoan[0].dia_chi,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 15,
                      ),
                      SizedBox(width: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: Text(
                          "Số điện thoại:     "+ widget.taiKhoan[0].so_dien_thoai,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ],
        ),
      );
  }
}
class DetailOrderItem extends StatelessWidget {
  final GioHang cart;
  const DetailOrderItem({Key? key,required this.cart,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0x80e59191) , width: 1),
          color: Color(0xFFFFE1FF),
        ),
        width: 300,
        height: 70,
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                      'http://10.0.2.2:8000/storage/' + cart.hinh_anh,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.black12,
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Text(
                    cart.ten_san_pham,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "Giá: " +cart.don_gia.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                   "Số lượng: "+cart.so_luong_mua.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}