import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/API/APIinvoice.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/Element/Titile.dart';
import 'package:giaodien/Element/colorbutton.dart';
import 'package:giaodien/models/ct_donhang.dart';
import 'package:giaodien/models/donhang.dart';
import 'package:provider/provider.dart';

List<int> text = [1, 2, 3, 4];

class InvoiceDetail extends StatelessWidget {
  final DonHang donhang;
  InvoiceDetail({Key? key, required this.donhang}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Map<String,String> data={
'_id_hoa_don':donhang.id.toString()
  };
  var layChiTiet=Provider.of<LayDonHangProvider>(context, listen: false);
  layChiTiet.laychitiet(data);
  List<CT_DonHang> lstChiTiet=layChiTiet.ctdonhang;

    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar('Thông tin đơn hàng'),
        backgroundColor: Color(0xffe59191),
      ),
      body: background(
          ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.place,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Địa chỉ giao hàng',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Text(
                              donhang.email,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black54),
                            ),
                            Text(
                      donhang.dia_chi,
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
      future: layChiTiet.laychitiet(data),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          height: 110.0 * lstChiTiet.length,
          child: ListView.builder(
            itemCount: lstChiTiet.length,
            itemBuilder: (context , index ) => chitiet(lstChiTiet[index]),
             
          ),
        );
      },),
                    
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border(top: BorderSide(color: Colors.black45))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Thành tiền',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            donhang.tong_tien.toString(),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Mã đơn hàng',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Text(
                              donhang.id.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                              ),
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Thời gian đặt hàng',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Text(
                              donhang.ngay_lap,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                              ),
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  if(donhang.loai_hd==0)
                  colorbutton(
            FlatButton(
              child: Text(
                'Chi tiết',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Righteous',
                  fontWeight: FontWeight.w600,
                ),
              ),
              textColor: Colors.black87,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {
              },
            ),)
                ],
              )
            ],
          ),
          context),
    );
    
  }
  chitiet(CT_DonHang hd){
    String link =
              'http://10.0.2.2:8000/storage/' + hd.hinh_anh;
    return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(children: [
                          SizedBox(
                            height: 5,
                          ),
                          Row(children: [
                            CachedNetworkImage(
                              width: 100,
                              height: 100,
                        fit: BoxFit.fill,
                        imageUrl: link,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.black12,
                        ),
                      ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                   alignment: Alignment.bottomRight,
                                  constraints: BoxConstraints(maxWidth: 300),
                                  child: Text(
                                    hd.ten_san_pham,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Text(
                                  'x'+hd.so_luong_ct.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  hd.don_gia_ct.toString()+' VND',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            )
                          ]),
                          SizedBox(
                            height: 5,
                          ),
                          
                        ]),
                        
                        );
  }
  
}
