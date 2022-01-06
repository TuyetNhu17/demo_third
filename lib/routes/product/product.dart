// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import '../API/sanpham.dart';
// import '../models/product.dart';
// import 'product_detail.dart';

// class PageProduct extends StatefulWidget {
//   const PageProduct({Key? key}) : super(key: key);
//   @override
//   ProductHome createState() => ProductHome();
// }

// class ProductHome extends State<PageProduct> {
//   Future<List<Product>> listSanPham = fetchPostSanPham();
//   var containerchude = Container(
//     height: 40,
//     decoration: BoxDecoration(
//       color: Colors.pink.shade100,
//       borderRadius: BorderRadius.circular(10),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.pink.withOpacity(0.5),
//           offset: const Offset(1, 3),
//           blurRadius: 4,
//           spreadRadius: 1,
//         ),
//       ],
//     ),
//     margin: const EdgeInsets.fromLTRB(10, 0, 180, 0),
//     child: const Center(
//       child: Text(
//         'Danh Sách Sản Phẩm',
//         style: TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.bold,
//           fontFamily: "Times New Roman",
//           color: Colors.red,
//         ),
//       ),
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     sanpham(AsyncSnapshot abc) {
//       return Wrap(
//         children: List.generate(abc.data.length, (index) {
//           String link = 'http://10.0.2.2:8000/images/catagory/' +
//               abc.data[index].hinh_anh;
//           return InkWell(
//             onTap: () {
//               // Navigator.push(
//               //     context,
//               //     MaterialPageRoute(
//               //         builder: (_) => PageDetail(product: abc.data[index])));
//               Navigator.pushNamed(context, '/product')
//             },
//             child: Card(
//               color: Colors.pink[50],
//               elevation: 5,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     height: 160,
//                     width: 160,
//                     child: ClipOval(
//                         child: Container(
//                       child: CachedNetworkImage(
//                         fit: BoxFit.fill,
//                         imageUrl: link,
//                         placeholder: (context, url) => const Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                         errorWidget: (context, url, error) => Container(
//                           color: Colors.black12,
//                         ),
//                       ),
//                     )),
//                   ),
//                   Text(
//                     'Tên sản phẩm: ${abc.data[index].ten_san_pham}',
//                     style: const TextStyle(
//                       fontFamily: 'Times New Roman',
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.pink,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Giá:  ${abc.data[index].don_gia} VNĐ',
//                     style: const TextStyle(
//                       fontFamily: 'Times New Roman',
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.pink,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           );
//         }),
//       );
//     }

//     var listView = ListView(children: [
//       const SizedBox(height: 20),
//       containerchude,
//       const SizedBox(height: 20),
//       Center(
//         child: FutureBuilder<List<Product>>(
//           future: listSanPham,
//           builder: (context, abc) {
//             if (abc.hasData) {
//               return sanpham(abc);
//             } else if (abc.hasError) {
//               return Text("${abc.error}");
//             }
//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     ]);

//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         backgroundColor: Colors.pink.shade50,
//         appBar: AppBar(
//           backgroundColor: Color(0xffe59191),
//           centerTitle: false,
//           automaticallyImplyLeading: false,
//           title: Container(
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: const [
//                   BoxShadow(
//                     offset: Offset(0, 10),
//                     blurRadius: 50,
//                     color: Colors.pink,
//                   ),
//                 ]),
//             child: TextField(
//               decoration: InputDecoration(
//                 enabledBorder: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//                 contentPadding: const EdgeInsets.only(top: 14),
//                 border: const OutlineInputBorder(),
//                 prefixIcon: IconButton(
//                   icon: const Icon(
//                     Icons.search,
//                   ),
//                   iconSize: 30,
//                   color: Colors.black,
//                   onPressed: () {},
//                 ),
//                 hintText: 'search',
//                 //suffixIcon: Icons.search,
//               ),
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: const Icon(
//                 Icons.shopping_cart,
//               ),
//               iconSize: 30,
//               color: Colors.white,
//               splashColor: Colors.pink.shade200,
//               onPressed: () {
//                 Navigator.pushNamed(context, '/invoice');
//               },
//             ),
//           ],
//         ),
//         body: listView,
//         //bottomNavigationBar: bottomNavigationBar2,
//       ),
//     );
//   }
// }
