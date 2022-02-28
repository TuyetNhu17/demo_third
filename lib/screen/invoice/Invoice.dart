import 'package:flutter/material.dart';
import 'package:giaodien/API/APIinvoice.dart';
import 'package:giaodien/Element/General.dart';
import 'package:giaodien/Element/Titile.dart';
import 'package:giaodien/Element/donhang.dart';
import 'package:giaodien/models/account.dart';
import 'package:giaodien/models/donhang.dart';
import 'package:provider/provider.dart';

List<int> text = [1, 2, 3, 4];
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class Invoice extends StatelessWidget {
  final List<Account> acc;
  final List<DonHang> donhang;
  const Invoice({Key? key, required this.acc, required this.donhang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var donhangAPI = Provider.of<LayDonHangProvider>(context, listen: false);
    Map<String, String> data = {
      '_email': acc[0].email,
    };
    donhangAPI.laydonhang(acc[0].email);

    List<DonHang> listDonHang = donhang;
    List<DonHang> listPending = [];
    List<DonHang> listToship = [];
    List<DonHang> listToreceive = [];
    List<DonHang> listComplete = [];
    List<DonHang> listCancelled = [];

    for (var inv in listDonHang) {
      if (inv.loai_hd == 0 || inv.loai_hd == 5) {
        listPending.add(inv);
      }
      if (inv.loai_hd == 1) {
        listToship.add(inv);
      }
      if (inv.loai_hd == 2) {
        listToreceive.add(inv);
      }
      if (inv.loai_hd == 3) {
        listComplete.add(inv);
      }
      if (inv.loai_hd == 4) {
        listCancelled.add(inv);
      }
    }
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: TitleAppBar('Đơn mua'),
              backgroundColor: Color(0xffe59191),
              bottom: const TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text: 'Chờ xác nhận'),
                  Tab(text: 'Chờ lấy hàng'),
                  Tab(text: 'Đang giao'),
                  Tab(text: 'Đã giao'),
                  Tab(text: 'Đã hủy')
                ],
              ),
            ),
            body: background1(
                TabBarView(children: [
                   ListView(
                        children: [
                          for (var inv in listPending)
                            Column(
                              children: [
                                don(context, inv),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            )]
                  ),
                  ListView(children: [
                    for (var inv in listToship)
                      Column(
                        children: [
                          don(context, inv),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      )
                  ]),
                  ListView(children: [
                    for (var inv in listToreceive)
                      Column(
                        children: [
                          don(context, inv),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      )
                  ]),
                  ListView(children: [
                    for (var inv in listComplete)
                      Column(
                        children: [
                          don(context, inv),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      )
                  ]),
                  ListView(children: [
                    for (var inv in listComplete)
                      Column(
                        children: [
                          don(context, inv),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      )
                  ])
                ]),
                context)));
  }
}
