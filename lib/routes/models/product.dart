class Product {
  final int id;
  final String name;
  final String description;
  final int quantily;
  final String imageUrl;
  final int idproducttype;
  final int price;
  //final int status;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quantily,
    required this.idproducttype,
    required this.price,
    
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['tensanpham'],
        description = json['mota'],
        imageUrl = json['hinh'],
        quantily = json['soluong'],
        idproducttype = json['idloaisanpham'],
        price = json['gia'];
        

  Map<String, dynamic> toJson() => {
        'id': id,
        'tensanpham': name,
        'mota': description,
        'hinh': imageUrl,
        'soluong': quantily,
        'idloaisanpham': idproducttype,
        'gia': price,
       
      };
}

