import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'routes/models/account.dart';

class ThietLapTK extends StatefulWidget {
  final List<Account> account;
  const ThietLapTK({Key? key, required this.account}) : super(key: key);
  @override
  State<ThietLapTK> createState() => _ThietLapTKState();
}

class _ThietLapTKState extends State<ThietLapTK> {
  late TextEditingController controller;
  var name='';

  @override
  void initState(){
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thiết lập tài khoản'),
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
      body: Container(
        child: Column(
        children: <Widget>[
        SizedBox(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Avarta'),
                  ),
                );
              }));
            },
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 30,),
                    Image.asset(
                      'images/banner/banner3.jpg',
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                    SizedBox(height: 5,),
                    Text("Sửa"),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Họ tên"),
                Spacer(),
                Text(widget.account[0].ho_ten),
                IconButton(
                  onPressed: () async {
                    final name = await openDialog();
                    if(name == null|| name.isEmpty) return;
                    setState(() {
                      this.name = name;
                    });
                  }, 
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Số điện thoại"),
                Spacer(),
                Text(widget.account[0].so_dien_thoai),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Email"),
                Spacer(),
                Text(widget.account[0].email),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Thay đổi mật khẩu"),
                Spacer(),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ),
      ],
      ),
      ), 
    );
  }
  
  Future<String?> openDialog()=>showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Thông tin'),
      content: TextField(
        decoration: InputDecoration(hintText: 'Vui lòng nhập...'),
        autofocus: true,
        controller: controller,
      ),
      actions: [
        TextButton(
          onPressed: (){
            submit();
          }, 
          child: Text('Hoàn thành'),
        ),
      ],
    ),
  );

  void submit(){
    Navigator.of(context).pop(controller.text);
  }
  

}

