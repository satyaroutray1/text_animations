import 'package:flutter/material.dart';
class RotatingText extends StatefulWidget {
  const RotatingText({super.key});

  @override
  State<RotatingText> createState() => _RotatingTextState();
}

class _RotatingTextState extends State<RotatingText> with TickerProviderStateMixin{
  late AnimationController _animationController1, _animationController2;
  late Animation _animation1, _animation2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController1 =AnimationController(vsync: this, duration: Duration(seconds: 10));

    _animation1 = Tween<double>(begin: -150, end: 0)
        .animate(CurvedAnimation(parent: _animationController1, curve: Curves.bounceOut)
    )..addListener((){
      setState(() {

      });
    })..addStatusListener((status) async{
      if(status == AnimationStatus.completed) {
        await Future.delayed(const Duration(seconds: 1));
        _animation1 = Tween<double>(begin: 0, end: 60).animate(CurvedAnimation(parent: _animationController1, curve: Curves.bounceIn))..addListener((){
          setState(() {

          });
        });
        _animationController1..reset()..forward();
      }

    });
    _animationController1.forward();

  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: 'Creative '),
        Stack(
          children: [
            Container(
              padding:EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.blueAccent,

              ),
              child: CustomText(text: 'coding',textColor: Colors.transparent),
            ),

            Positioned(
              bottom: _animation1.value,
              child: Container(
                  padding:EdgeInsets.symmetric(horizontal: 10),
                  child: CustomText(text: 'coding',)),
            ),
          ],
        )
      ],
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.textColor});
  final String text;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 40,
      color: textColor ?? Colors.black
    ),);
  }
}

