import 'dart:math';

import 'package:flutter/material.dart';

import 'constants.dart';

class GlitchTextLetter extends StatefulWidget{
  final String letter;
  const GlitchTextLetter(this.letter, {super.key});

  @override
  State<GlitchTextLetter> createState() => _GlitchTextLetterState();
}

class _GlitchTextLetterState extends State<GlitchTextLetter> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 360));
    _animation = Tween<double>(begin: 2, end: 5).animate(_animationController)..addListener((){
      setState(() {

      });
    });
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Shadow layer: red glitch
        Text(
          widget.letter,
          style: const TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            color: Colors.yellow,
          ),
        ),
        Positioned(
          left: _animation.value,
          top: _animation.value,
          child: Text(
            widget.letter,
            style: const TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
        Positioned(
          right: _animation.value,
          bottom: _animation.value,
          child: Text(
            widget.letter,
            style: const TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
        // Main black letter
        Text(
          widget.letter,
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            color: Constants.textColor,
          ),
        ),
      ],
    );
  }
}

/*
class FuzzyText extends StatefulWidget {
  final String text;
  const FuzzyText(this.text, {super.key});

  @override
  State<FuzzyText> createState() => _FuzzyTextState();
}

class _FuzzyTextState extends State<FuzzyText> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  final _random = Random();

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(widget.text.length, (index) {
      final duration = Duration(
          milliseconds: 300 + _random.nextInt(400)); // 300–700ms per char
      final controller =
      AnimationController(vsync: this, duration: duration)..repeat(reverse: true);
      return controller;
    });

    _animations = _controllers
        .map((controller) => Tween<double>(begin: -1.5, end: 1.5).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    ))
        .toList();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2,
      children: List.generate(widget.text.length, (i) {
        final char = widget.text[i];

        return AnimatedBuilder(
          animation: _animations[i],
          builder: (context, child) {
            // Slight flicker effect in opacity
            final flicker = 0.8 + _random.nextDouble() * 0.2;

            return Opacity(
              opacity: flicker,
              child: Transform.translate(
                offset: Offset(_animations[i].value, -_animations[i].value),
                child: Text(
                  char,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Constants.textColor,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                          color: Colors.blueAccent.withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(1, 1)),
                      Shadow(
                          color: Colors.redAccent.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(-1, -1)),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
*/