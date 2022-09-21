import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
                radius: 20.0),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
          child: FadeInImage(
              fadeInDuration: Duration(milliseconds: 200),
              image: NetworkImage(
                  'https://images.pexels.com/photos/6777376/pexels-photo-6777376.jpeg'),
              placeholder: AssetImage('assets/jar-loading.gif'))),
    );
  }
}
