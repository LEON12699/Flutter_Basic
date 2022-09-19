import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final TextStyle _styleText = const TextStyle(fontSize: 25);

  int _counter = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('StatefulWidget'),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de clicks:', style: _styleText),
            Text('$_counter', style: _styleText)
          ],
        )),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _createButtons());
  }

  Widget _createButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30.0),
        FloatingActionButton(
            child: Icon(Icons.exposure_zero),
            onPressed: () => _operation('reset')),
        Expanded(
          child: SizedBox(
            width: 6.0,
          ),
        ),
        FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () => _operation('substract')),
        SizedBox(
          width: 6.0,
        ),
        FloatingActionButton(
            child: Icon(Icons.add), onPressed: () => _operation('add')),
      ],
    );
  }

  void _add() {
    setState(() => _counter++);
  }

  void _substract() {
    setState(() => _counter--);
  }

  void _reset() {
    setState(() => _counter = 0);
  }

  void _operation(String operation) {
    operation = operation.toLowerCase();
    switch (operation) {
      case 'add':
        _add();
        break;
      case 'substract':
        _substract();
        break;
      case 'reset':
        _reset();
        break;
      default:
        print('Operación no válida');
    }
  }
}
