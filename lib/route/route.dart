
import 'package:credit_card_picker/views/card_screen.dart';

import 'package:credit_card_picker/views/settings_page.dart';
import 'package:flutter/material.dart';




class Routes {
  static const String cardScreen = "/cardScreen";
}

class NavigationServices {
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.cardScreen:
        return MaterialPageRoute(builder: (_) => const CardScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}


