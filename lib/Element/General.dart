import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget background(Widget lb, context) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffe59191),
                    Color(0x99e59191),
                    Color(0x66e59191),
                  ]),
            ),
            child: lb,
          ),
        ]),
      ));
}

Widget background1(TabBarView lb, context) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffe59191),
                    Color(0x99e59191),
                    Color(0x66e59191),
                  ]),
            ),
            child: lb,
          ),
        ]),
      ));
}
class CartCounter extends StatefulWidget{
  const CartCounter({Key? key}) : super(key: key);

  @override 
  _CartCounterState createState() => _CartCounterState();
}
class _CartCounterState extends State<CartCounter>
{
  int numOfItems=1;
   @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: ()  { 
            if (numOfItems>1){
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const  EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            numOfItems.toString().padLeft(2,"0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(icon: Icons.add, press: () {
          setState(() {
            numOfItems++;
          });
        }),
      ],
    ) ;
  }
  SizedBox buildOutlineButton({required IconData icon, required Function() press}){
    return SizedBox(
          width: 40,
          height: 32,
          child: OutlineButton(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            onPressed: press,
            child: Icon(icon),
          ),
        );
  }
}

