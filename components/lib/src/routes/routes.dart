import 'package:flutter/material.dart';

import '../pages/alert_page.dart';
import '../pages/animated_container.dart';
import '../pages/avatar_page.dart';
import '../pages/cards_page.dart';
import '../pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPage(),
    'avatar': (BuildContext context) => const AvatarPage(),
    'card': (BuildContext context) => const CardPage(),
    'animatedContainer': (BuildContext context) => const AnimateContainerPage(),
  };
}
