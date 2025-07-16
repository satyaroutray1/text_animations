import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
        )
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          TextPressure('Hello There'),
          GradientText(),

        ],
      )
    ));
  }
}


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
                  fontWeight: _hovered[index] == true ? FontWeight.bold : FontWeight.w300,
                  //color: Colors.white,
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
    _animation = Tween<double>(begin: 0, end: 200).animate(_animationController)
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
        final rect = bounds.shift(Offset(_animation.value, 5));
        return textGradient.createShader(rect);
      },
      child: Text('Hello there', style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold
      ),),
    );
  }
}
