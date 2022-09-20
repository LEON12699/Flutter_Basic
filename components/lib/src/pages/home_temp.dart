import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({key});

  final options = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Componentes Temp')),
      body: ListView(children: _createItemsMap() /*_createItems()*/),
    );
  }

  // for create a list of widgets
  List<Widget> _createItems() {
    List<Widget> list = [];
    for (String opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      list
        ..add(tempWidget)
        ..add(const Divider());
    }
    return list;
  }

  // map list
  List<Widget> _createItemsMap() {
    return options.map((String item) {
      return Column(
        children: [
          ListTile(
            title: Text(item),
            subtitle: Text("Subtitlulo"),
            leading: Icon(Icons.abc_sharp),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
