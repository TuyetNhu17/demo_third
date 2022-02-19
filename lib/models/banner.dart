class Banner {
  final int id;
  
  final String imgurl;

  Banner({
    required this.id,
    
    required this.imgurl
  });
}

final List<Banner> banner = [
  Banner(
    id: 1,
    imgurl: 'images/banner/banner1.png'
    
    
  ),
  Banner(
    id: 2,
    imgurl: 'images/banner/banner2.png'
    
  ),
  Banner(
    id: 3,
    imgurl: 'images/banner/banner3.jpg'
    
  ),
  
];
