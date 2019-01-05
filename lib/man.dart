import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Man extends StatelessWidget{
  Man(this.dooms);
  final int dooms;
  final transitionTime = Duration(milliseconds: 300);

  @override

  Widget build(BuildContext context){
    return Stack(children: <Widget>[
      new AnimatedOpacity( child: Image.asset("assets/0.png", color: Colors.white), opacity: dooms < 1 ? 0 : 1, duration: transitionTime),
      new AnimatedOpacity( child: Image.asset("assets/1.png", color: Colors.white), opacity: dooms < 2 ? 0 : 1, duration: transitionTime),
      new AnimatedOpacity( child: Image.asset("assets/2.png", color: Colors.white), opacity: dooms < 3 ? 0 : 1, duration: transitionTime),
      new AnimatedOpacity( child: Image.asset("assets/3.png", color: Colors.white), opacity: dooms < 4 ? 0 : 1, duration: transitionTime),
      new AnimatedOpacity( child: Image.asset("assets/5.png", color: Colors.white), opacity: dooms < 6 ? 0 : 1, duration: transitionTime),
      new AnimatedOpacity( child: Image.asset("assets/4.png", color: Colors.white), opacity: dooms < 5 ? 0 : 1, duration: transitionTime),
      new AnimatedOpacity( child: Image.asset("assets/6.png", color: Colors.white), opacity: dooms < 7 ? 0 : 1, duration: transitionTime),
      new AnimatedOpacity( child: Image.asset("assets/7.png", color: Colors.white), opacity: dooms < 8 ? 0 : 1, duration: transitionTime),
      new AnimatedOpacity( child: Image.asset("assets/8.png", color: Colors.white), opacity: dooms < 9 ? 0 : 1, duration: transitionTime),
      new AnimatedOpacity( child: Image.asset("assets/9.png", color: Colors.white), opacity: dooms < 10 ? 0 : 1, duration: transitionTime),
      new AnimatedOpacity( child: Image.asset("assets/10.png", color: Colors.white), opacity: dooms < 11 ? 0 : 1, duration: transitionTime),
      new AnimatedOpacity( child: Image.asset("assets/11.png", color: Colors.red,), opacity: dooms < 12 ? 0 : 1, duration: transitionTime),
      ],);
  }
}