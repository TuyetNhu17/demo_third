import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:giaodien/API/APIinvoice.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/Element/Titile.dart';
import 'package:giaodien/Element/colorbutton.dart';
import 'package:giaodien/models/ct_donhang.dart';
import 'package:giaodien/models/donhang.dart';
import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:intl/intl.dart';

List<int> text = [1, 2, 3, 4];

class InvoiceDetail extends StatefulWidget {
  final DonHang donhang;
  InvoiceDetail({Key? key, required this.donhang}) : super(key: key);

  @override
  State<InvoiceDetail> createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> data = {'_id_hoa_don': widget.donhang.id.toString()};
    Future<List<CT_DonHang>> listchitiet =
        LayDonHangProvider().laychitiet(data);

    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar('Thông tin đơn hàng'),
        backgroundColor: Color(0xffe59191),
      ),
      body: background(
          Center(
            child: ListView(
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
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              Text(
                                widget.donhang.email,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black54),
                              ),
                              Text(
                                widget.donhang.dia_chi,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black54),
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
                    FutureBuilder<List<CT_DonHang>>(
                      future: listchitiet,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return chitiet(snapshot);
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
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
                             NumberFormat.decimalPattern().format(widget.donhang.tong_tien)+' VND',
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
                                widget.donhang.id.toString(),
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
                                widget.donhang.ngay_lap,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange,
                                ),
                                textAlign: TextAlign.end,
                              )
                            ],
                          ),
                          SizedBox(height: 5,)
                        ],
                      ),
                    ),
                    if (widget.donhang.loai_hd == 0)
                      colorbutton(
                        FlatButton(
                          child: Text(
                            'Hủy đơn hàng',
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
                          onPressed: () async {
                            huydon(widget.donhang.id.toString(), context);
                          },
                        ),
                      )
                  ],
                )
              ],
            ),
          ),
          context),
    );
  }

  huydon(mahd, context) async {
    EasyLoading.show();
    var kq = await LayDonHangProvider().huydonhang(mahd);
    if (kq.toString() == "Success") {
      // EasyLoading.show();
      // Future.delayed(const Duration(seconds: 2));
      // EasyLoading.dismiss();
    //  return Fluttertoast.showToast(
    //       msg: "This is Center Short Toast",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 2,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);

          // ProgressHud.showLoading();
          //           await Future.delayed(const Duration(seconds: 2));
          //           ProgressHud.dismiss();
          return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: RichText(
                textAlign: TextAlign.center,
                  text: WidgetSpan(
                child: Icon(
                  Icons.done,
                  size: 25,
                ),
              )),
              content: Text('Đã gửi yêu cầu'),
              backgroundColor: Colors.white,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Xong'))
              ],
            ));
    }
  }

  chitiet(AsyncSnapshot snapshot) {
    return Wrap(
        children: List.generate(snapshot.data.length, (index) {
      String link =
          'http://10.0.2.2:8000/storage/' + snapshot.data[index].hinh_anh;
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
                    snapshot.data[index].ten_san_pham,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  'x' + snapshot.data[index].so_luong_ct.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  NumberFormat.decimalPattern().format(snapshot.data[index].don_gia_ct) + ' VND',
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
    }));
  }
}
