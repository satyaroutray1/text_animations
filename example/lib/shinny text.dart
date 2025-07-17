import 'package:flutter/material.dart';

class ShinnyText extends StatefulWidget {
  const ShinnyText({super.key, required this.text});

  final String text;
  @override
  State<ShinnyText> createState() => _ShinnyTextState();
}

class _ShinnyTextState extends State<ShinnyText> with SingleTickerProviderStateMixin{
  final textGradient = LinearGradient(colors: [Colors.grey, Colors.white, Colors.grey]);

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(begin: -.5, end: 1).animate(_animationController)
      ..addListener((){
        setState(() {

        });
      });
    _animationController.repeat(reverse: false);
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
      child: Text(widget.text, style: TextStyle(
          fontSize: 40,
          //fontWeight: FontWeight.bold
      ),),
    );
  }
}
