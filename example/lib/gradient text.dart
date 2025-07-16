import 'package:flutter/material.dart';
// GRADIENT TEXT ANIMATION (using ShaderMask)
class GradientText extends StatefulWidget{
  const GradientText({super.key});

  @override
  State<GradientText> createState() => _GradientTextState();
}

class _GradientTextState extends State<GradientText> with SingleTickerProviderStateMixin{

  final textGradient = LinearGradient(colors: [Colors.red, Colors.teal, Colors.green]);

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: -.5, end: .5).animate(_animationController)
      ..addListener((){
        setState(() {

        });
      });
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        final rect = bounds.shift(Offset(_animation.value*bounds.width, 5));
        return textGradient.createShader(rect);
      },
      child: Text('Hello there', style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold
      ),),
    );
  }
}
