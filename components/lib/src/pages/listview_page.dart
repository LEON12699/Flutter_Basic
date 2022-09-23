import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _numberList = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addImages(10);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _addImages(10);
        _fetchData();
      }
    });
    /* if (_scrollController.hasClients) {
      print(_scrollController.position.pixels);
      print(_scrollController.position.maxScrollExtent);
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent - 100.0) {
        //_addImages(10);

        _fetchData();
      }
    } */
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (_scrollController.hasClients) {
      _scrollController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas'),
      ),
      body: Stack(children: [createList(), createLoading()]),
    );
  }

  Widget createList() {
    return RefreshIndicator(
      onRefresh: _getPage1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://picsum.photos/500/300/?image=${_numberList[index]}'));
        },
      ),
    );
  }

  Future _getPage1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numberList.clear();
      _ultimoItem++;
      _addImages(10);
    });

    return Future.delayed(duration);
  }

  void _addImages(int count) {
    for (var i = 0; i < count; i++) {
      _ultimoItem++;
      _numberList.add(_ultimoItem);
    }
    setState(() {});
  }

  Future<Timer> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final duration = new Duration(seconds: 2);
    return Timer(duration, _responseHTTP);
  }

  void _responseHTTP() {
    _isLoading = false;
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.position.pixels + 100,
          duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    }
    _addImages(10);
  }

  Widget createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
