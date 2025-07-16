import 'package:flutter/material.dart';
class RotatingText extends StatefulWidget {
  const RotatingText({super.key});

  @override
  State<RotatingText> createState() => _RotatingTextState();
}

class _RotatingTextState extends State<RotatingText> with TickerProviderStateMixin{
  late AnimationController _animationController1, _animationController2;
  late Animation _animation1, _animation2;

  List<String> skills = ['coding', 'minds', 'collect'];

  int index = 0;

  @override
  void initState() {
    super.initState();
    _animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    first();
  }

  void first() {
    _animation1 = Tween<double>(begin: -150, end: 0)
        .animate(CurvedAnimation(parent: _animationController1, curve: Curves.bounceOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Future.delayed(const Duration(seconds: 1));
          second();
        }
      });

    _animationController1..reset()..forward();
  }

  void second() {
    _animation1 = Tween<double>(begin: 0, end: 60)
        .animate(CurvedAnimation(parent: _animationController1, curve: Curves.bounceIn))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            //index = (index + 1) % skills.length;
          });
          first(); // loop
        }
      });

    _animationController1..reset()..forward();
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
              child: CustomText(text: skills[index],textColor: Colors.transparent),
            ),

            Positioned(
              bottom: _animation1.value,
              child: Container(
                  padding:EdgeInsets.symmetric(horizontal: 10),
                  child: CustomText(text: skills[index],)),
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

