import 'package:flutter/material.dart';

class BlurText extends StatefulWidget {
  const BlurText({super.key});

  @override
  State<BlurText> createState() => _BlurTextState();
}

class _BlurTextState extends State<BlurText> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;
  late List<Animation<double>> dropAnimations;

  final List<String> words = ['Flutter', 'animations', 'are', 'awesome','Flutter'];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    dropAnimations = [];

    for (int i = 0; i < words.length; i++) {
      double start = i * 1/words.length;
      double end = start + 1/words.length;

      _animation = Tween<double>(begin: 0, end: 100.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(start, end, ),
        ),
      )..addListener(() {
        setState(() {});
      });

      dropAnimations.add(_animation);
    }
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(int i = 0; i < words.length; i++)
          Column(
            children: [
              SizedBox(
                height: dropAnimations[i].value,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  words[i],
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(dropAnimations[i].value/100),
                  ),
                ),
              ),
            ],
          )

      ]
    );
  }
}
