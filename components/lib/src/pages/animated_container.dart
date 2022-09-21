import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimateContainerPage extends StatefulWidget {
  const AnimateContainerPage({key});

  @override
  State<AnimateContainerPage> createState() => _AnimateContainerPageState();
}

class _AnimateContainerPageState extends State<AnimateContainerPage> {
  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.pink;
  BorderRadius _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
          child: AnimatedContainer(
        width: _width,
        height: _heigth,
        decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: _cambiarForma,
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();

    setState(() {
      _width = random.nextInt(300).toDouble();
      _heigth = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
