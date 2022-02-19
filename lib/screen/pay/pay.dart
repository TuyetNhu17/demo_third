
import 'package:flutter/material.dart';
import 'package:giaodien/API/APIgiohanng.dart';
import 'package:giaodien/API/APIinvoice.dart';
import 'package:giaodien/models/account.dart';
import 'package:giaodien/models/giohang.dart';
import 'package:provider/provider.dart';
import '../../Element/info_pay.dart';
class PayScreen extends StatelessWidget  {
  final List<Account> acc;
  const PayScreen({Key? key, required this.acc}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var list = Provider.of<LayGioHangProvider>(context, listen: false);
    list.laygiohang(acc[0].email);
    List<GioHang> giohang = list.giohang;

    int tong = 0;
    for(var cart in giohang){
      tong = tong + (cart.don_gia * cart.so_luong_mua);
    }
    print(tong);

    Future thanhToan(var tong) async
    {

      Map<String ,String > data ={
        'email' : acc[0].email.toString(),  
        '_dia_chi': acc[0].dia_chi.toString(),
        '_so_dien_thoai': acc[0].so_dien_thoai.toString(),
        '_tong_tien'  :  tong.toString(),
      };
      print(acc[0].email);
      print(acc[0].dia_chi);
      print(acc[0].so_dien_thoai);
      print(tong);

      bool checkCreateInvoice = await HoaDonGet.createInvoice(data);
      print(checkCreateInvoice);
      if( checkCreateInvoice == true)
      {
        Map<String ,String > data1 ={
        'email' : acc[0].email.toString(),  
        };
        var mahd = await HoaDonGet.getInvoiceId(data1);
        print("MaHD la: " + mahd);
        for(var cart in giohang)
        {
          Map<String ,String > data2 ={
            '_id': mahd.toString(),
            '_id_san_pham' : cart.id_san_pham.toString(),
            '_so_luong' : cart.so_luong_mua.toString(),
            '_don_gia': cart.don_gia.toString(),
            '_tong': tong.toString(),
          };
          HoaDonGet.addInvoiceDetail(data2);
        }
      }
      else
      {
        print("Khong thanh cong");
      }
      
    }

    xoaCart(int id) async {
      Map<String, int> data = {
        '_id_khach_hang': id,
      };
      var res = await doneXoa(data);
      if (res == 'Success') {
        print(res);
      }
    }
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh toán'),
        backgroundColor: Color(0xcce59191),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Info(tongTien: tong, taiKhoan: acc),
      bottomNavigationBar: Container(
                height: 200,
                //width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffe59191),
                        Color(0xffe59191),
                        Color(0xffe59191),
                      ]),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Tổng thanh toán",
                                style: TextStyle(
                                  color: Colors.black, 
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Spacer(),
                              Text(
                                tong.toString() + ' VND', 
                                style: TextStyle(
                                  color: Colors.black, 
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5,
                          onPressed: () {
                            thanhToan(tong);
                            xoaCart(acc[0].id);
                            
                            Navigator.pushNamed(context, '/done');
                          },
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Color(0xffe59191),
                          child: Text(
                            'Xác nhận',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  } 
}