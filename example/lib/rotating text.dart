import 'constants.dart';
import 'package:flutter/material.dart';

class RotationText extends StatefulWidget {
  const RotationText({super.key});

  @override
  State<RotationText> createState() => _RotationTextState();
}

class _RotationTextState extends State<RotationText> with SingleTickerProviderStateMixin {
  late AnimationController _animationController1;
  late Animation<double> _animation1;

  final List<String> skills = ['coding', 'design', 'ideas', 'teams', 'growth'];
  int index = 0;

  @override
  void initState() {
    super.initState();

    _animationController1 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _setupAnimation();

    _animationController1.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(Duration(milliseconds: 500)); // brief pause before next

        setState(() {
          if(index < skills.length-1){
            index++;
          }else{
            index = 0;
          }
        });

        _setupAnimation();
        _animationController1.forward(from: 0);
      }
    });

    _animationController1.forward();
  }

  void _setupAnimation() {
    _animation1 = Tween<double>(begin: -100, end: 0).animate(
      CurvedAnimation(parent: _animationController1, curve: Curves.easeOut),
    )..addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController1.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: 'Creative '),
        Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.blueAccent,
              ),
              child: CustomText(text: skills[index], textColor: Colors.transparent),
            ),
            Positioned(
              bottom: _animation1.value,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomText(text: skills[index]),
              ),
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
        color: textColor ?? Constants.textColor
    ),);
  }
}