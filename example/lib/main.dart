import 'package:example/blur%20text.dart';
import 'package:example/constants.dart';
import 'package:example/curved%20loop.dart';
import 'package:example/rotating%20text.dart';
import 'package:example/shinny%20text.dart';
import 'package:example/text%20pressure.dart';
import 'package:flutter/material.dart';

import 'circular text.dart';
import 'fade in.dart';
import 'glitch text.dart';
import 'gradient text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      backgroundColor: Constants.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              BlurText(words: ['Flutter', 'animations', 'are', 'awesome'],),

               RotationText(),
               TextPressure('Hello There'),
              GradientText(text: 'Hello There'),
              CircularText(text: 'Hello There,You!! Flutter!',),

              //FuzzyText('ttttttttt'),
              GlitchTextLetter('Hello There'),
              ShinnyText(text: 'Hello There'),

              //WordFadeInText(sentence: 'Flutter animations are awesome'),
               CurvedLoop()
            ],
          ),
        ),
      )
    ));
  }
}
