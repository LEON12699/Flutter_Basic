import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();


  List<int> _numberList= new List();
  int _ultimoItem = 0;


  @override
  void initState(){
    super.initState();
    _addImages(10);

    _scrollController.addListener((){

    });

    if (_scrollController.position.pixeles == _scrollController.position.maxScrollExtent-10.0){
      _addImages(10);
    }

  }

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
      controller: __scrollController,
      itemCount: _numberList.length,
      itemBuilder: (BuildContext context, int index) {
        return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://picsum.photos/500/300/?image=${_numberList[index]}'));
      },
    );
  }

  void _addImages(int count){
    for (var i = 0; i < count; i++) {
      _ultimoItem++;
      _numberList.add(_ultimoItem);
    }
    setState((){

    });
  }
}
