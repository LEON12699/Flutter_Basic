import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/home_temp.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Componentes',
        debugShowCheckedModeBanner: false,
        //home: HomePage(),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => const HomePage(),
          'alert': (BuildContext context) => const AlertPage(),
          'avatar': (BuildContext context) => const AvatarPage(),
        });
  }
}