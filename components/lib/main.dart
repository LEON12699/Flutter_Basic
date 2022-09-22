import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('es', 'ES'), // Spanish
        ],
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
