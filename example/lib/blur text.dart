import 'package:flutter/material.dart';

import 'constants.dart';

class BlurText extends StatefulWidget {
  const BlurText({super.key, required this.words});

  final List<String> words;
  @override
  State<BlurText> createState() => _BlurTextState();
}

class _BlurTextState extends State<BlurText> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;
  late List<Animation<double>> dropAnimations;

   //List<String> words = widget.textlist;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    dropAnimations = [];

    for (int i = 0; i < widget.words.length; i++) {
      double start = i * 1/widget.words.length;
      double end = start + 1/widget.words.length;

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
        for(int i = 0; i < widget.words.length; i++)
          Column(
            children: [
              SizedBox(
                height: dropAnimations[i].value,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.words[i],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Constants.textColor.withOpacity(dropAnimations[i].value/100),
                  ),
                ),
              ),
            ],
          )

      ]
    );
  }
}
