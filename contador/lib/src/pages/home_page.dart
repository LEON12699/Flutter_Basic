import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextStyle styleText = new TextStyle(fontSize: 25);
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Número de clicks:', style: styleText),
          Text('0', style: styleText)
        ],
      )),
    );
  }
}
