import 'package:flutter/material.dart';

import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/home_temp.dart';
import 'package:components/src/routes/routes.dart';

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
        routes: getApplicationRoutes(),
        onGenerateRoute: (RouteSettings settings) {
          print('$settings.name');
          return MaterialPageRoute(
              builder: (BuildContext context) => const AlertPage());
        });
  }
}
