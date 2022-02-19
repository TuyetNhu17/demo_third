import 'package:flutter/material.dart';

class ScreenLoad extends StatefulWidget {
  const ScreenLoad({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenLoad>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.repeat();
    _load();
  }

  _load() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffe59191),
                  Color(0x99e59191),
                  Color(0x66e59191),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Image.asset('images/logo.png',width: 200,),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'SHOP HOA NVN',
                    style: TextStyle(
                      //color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.pink.shade700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: RotationTransition(
                  turns: animation,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset('images/logohoa1.png'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
