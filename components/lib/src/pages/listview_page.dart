import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _numberList = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      itemCount: _numberList.length,
      itemBuilder: (BuildContext context, int index) {
        return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://picsum.photos/500/300/?image=${_numberList[index]}'));
      },
    );
  }
}
