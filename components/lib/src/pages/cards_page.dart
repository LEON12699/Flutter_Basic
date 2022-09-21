import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cards'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cardTipo1(),
          ],
        ));
  }

  Widget _cardTipo1() {
    return Card(
        child: Column(children: <Widget>[
      ListTile(
          leading: const Icon(Icons.photo_album, color: Colors.blue),
          title: const Text('Soy el titulo de esta tarjeta'),
          subtitle: const Text('Aqui estamos con la descripcion')),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        TextButton(
            onPressed: () {},
            child:
                const Text('Cancelar', style: TextStyle(color: Colors.blue))),
        TextButton(
            onPressed: () {},
            child: const Text('Ok', style: TextStyle(color: Colors.blue)))
      ]),
    ]));
  }
}
