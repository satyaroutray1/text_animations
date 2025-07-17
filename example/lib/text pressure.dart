import 'package:example/constants.dart';
import 'package:flutter/material.dart';

class TextPressure extends StatefulWidget {
  final String text;
  const TextPressure(this.text, {super.key});

  @override
  State<TextPressure> createState() => _TextPressureState();
}

class _TextPressureState extends State<TextPressure> {
  final Map<int, bool> _hovered = {};

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(widget.text.length, (index) {
        final char = widget.text[index];

        return MouseRegion(
          onEnter: (_) => setState(() => _hovered[index] = true),
          onExit: (_) => setState(() => _hovered[index] = false),
          child: GestureDetector(
            onTapDown: (_) => setState(() => _hovered[index] = true),
            onTapUp: (_) => setState(() => _hovered[index] = false),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              transform: _hovered[index] == true
                  ? (Matrix4.identity()..translate(5.0, 0.0))
                  : Matrix4.identity(),
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                char,
                style:  TextStyle(
                  fontSize: 36,
                  fontWeight: _hovered[index] == true ? FontWeight.w900 : FontWeight.w300,
                  color: Constants.textColor,
                  letterSpacing: 4,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

