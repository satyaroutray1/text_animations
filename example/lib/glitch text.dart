import 'package:flutter/material.dart';

class GlitchTextLetter extends StatelessWidget {
  final String letter;
  const GlitchTextLetter(this.letter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Shadow layer: red glitch
        Text(
          letter,
          style: const TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        Positioned(
          left: 2,
          child: Text(
            letter,
            style: const TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        Positioned(
          right: 2,
          child: Text(
            letter,
            style: const TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
        // Main black letter
        Text(
          letter,
          style: const TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
