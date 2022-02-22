import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/models/donhang.dart';
import 'package:giaodien/screen/invoice/InvoiceDetail.dart';
import 'colorbutton.dart';

Widget don(BuildContext context,DonHang hd) {
  String link = 'http://10.0.2.2:8000/storage/' + hd.hinh_anh;
  
  return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Row(children: [
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.only(left: 10),
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
                    ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                constraints: BoxConstraints(maxWidth: 250),
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
                  fontSize: 20,
                ),
              ),
              Text(
                hd.don_gia_ct.toString()+' VND',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),
            ],
          )
        ]),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black45))),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Thành tiền : '+hd.tong_tien.toString()+' VND',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black45))),
          child: colorbutton(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => InvoiceDetail(donhang: hd,)));
              },
            ),
          ),
        ),
      ]),
  );
}
