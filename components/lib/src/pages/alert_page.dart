import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alert Page')),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.add_location)),
    );
  }
}
