import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animation Container",
      home: AnimatedCont(),
    );
  }
}

class AnimatedCont extends StatefulWidget {
  const AnimatedCont({Key? key}) : super(key: key);

  @override
  _AnimatedContState createState() => _AnimatedContState();
}

class _AnimatedContState extends State<AnimatedCont> {
  final _random = Random();
  var currentColor = Colors.black;
  double _height = 100;
  double _width = 200;
  var _Border = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animation Container'),
        ),
        body: Center(
          child: AnimatedContainer(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              borderRadius: _Border,
              color: currentColor,
            ),
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _height = _random.nextInt(300).toDouble();
              _width = _random.nextInt(300).toDouble();
              currentColor =
                  Colors.primaries[_random.nextInt(Colors.primaries.length)];
              _Border = BorderRadius.circular(_random.nextInt(100).toDouble());
            });
          },
          child: Icon(Icons.play_arrow_sharp),
        ),
      ),
    );
  }
}
