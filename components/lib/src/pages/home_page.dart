import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

import 'alert_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Componentes')),
      body: _Lista(),
    );
  }

  Widget _Lista() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data!, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon'], Colors.redAccent),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.red),
        onTap: () {
          /* final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.push(context, route); */
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      options
        ..add(widgetTemp)
        ..add(const Divider());
    });

    return options;
  }
}
