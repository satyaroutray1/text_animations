import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';

class CircularText extends StatefulWidget {
  const CircularText({super.key});

  @override
  State<CircularText> createState() => _CircularTextState();
}

class _CircularTextState extends State<CircularText> with SingleTickerProviderStateMixin{

  AnimationController? _controller;
  Animation<double>? _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 10));
    _animation = Tween<double>(begin: -pi/2, end: 2*pi).animate(_controller!)..addListener((){
      setState(() {

      });
    });
    _controller?.repeat();
  }
  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
  @override
  Widget build(BuildContext context){
    return
      Container(
        height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.all(Radius.circular(100))
          ),
        //margin: EdgeInsets.symmetric(horizontal: 10),
        child: ArcText(
            radius: 85,
            text: 'Hello There,You!! Flutter!',
            textStyle: TextStyle(fontSize: 24, color: Colors.black,
            fontWeight: FontWeight.bold, letterSpacing: 5),
            startAngle: _animation!.value,
            startAngleAlignment: StartAngleAlignment.start,
            placement: Placement.middle,
            direction: Direction.clockwise
        ),
      )
    ;
  }
}