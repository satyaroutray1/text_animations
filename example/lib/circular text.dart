import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';

class CircularText extends StatefulWidget {
  const CircularText({super.key});

  @override
  State<CircularText> createState() => _CircularTextState();
}

class _CircularTextState extends State<CircularText>{

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
        margin: EdgeInsets.all(150),
        child: ArcText(
            radius: 90,
            text: 'Hello There, You!Hello There, YouHello There, You',
            textStyle: TextStyle(fontSize: 18, color: Colors.black),
            startAngle: -pi/2,
            startAngleAlignment: StartAngleAlignment.start,
            placement: Placement.middle,
            direction: Direction.clockwise
        ),
      )
    ;
  }
}