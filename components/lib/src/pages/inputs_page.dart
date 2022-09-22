import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inputs de texto'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearInput(),
            const Divider(),
            _crearPersona(),
          ],
        ));
  }

  Widget _crearInput() {
    return TextField(
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            counter:  Text('Letras ${_nombre.length }'),
            hintText: 'Nombre de la persona',
            labelText: 'Nombre',
            helperText: 'Solo es el nombre',
            suffixIcon: const Icon(Icons.accessibility),
            icon: const Icon(Icons.account_circle)),
        onChanged: (valor) {
          setState(() {
          _nombre = valor;
          print('nombre: $_nombre');            
          });

        });
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('nombre es $_nombre')
    );
  }
}
