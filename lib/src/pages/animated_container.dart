import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  //AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadius _borde = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.decelerate,
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borde, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _changeContainer),
    );
  }

  void _changeContainer() {
    final rand = Random();

    int widthRange = 500;
    int heightRange = 700;

    setState(() {
      _width = rand.nextDouble() * widthRange;
      _height = rand.nextDouble() * heightRange;
      _color = Color.fromRGBO(rand.nextInt(255), rand.nextInt(255),
          rand.nextInt(255), rand.nextInt(100).roundToDouble());
      _borde = BorderRadius.circular(rand.nextInt(50).roundToDouble());
    });
  }
}
