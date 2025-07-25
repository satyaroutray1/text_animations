import 'dart:math';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CurvedLoop extends StatefulWidget {
  const CurvedLoop({super.key});

  @override
  State<CurvedLoop> createState() => _CurvedLoopState();
}

class _CurvedLoopState extends State<CurvedLoop> with SingleTickerProviderStateMixin{

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
        height: 250,
        width: 200,
        // decoration: BoxDecoration(
        //     color: Colors.lightBlueAccent,
        //     borderRadius: BorderRadius.all(Radius.circular(100))
        // ),
        //margin: EdgeInsets.symmetric(horizontal: 10),
        child: ArcText(
            radius: 100,//MediaQuery.of(context).size.width,
            text: 'Hello There',
            textStyle: TextStyle(fontSize: 24, color: Constants.textColor,
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