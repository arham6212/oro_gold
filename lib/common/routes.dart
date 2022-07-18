import 'package:flutter/material.dart';
import 'package:oro_gold/screens/choose_plan_screen.dart';
import 'package:oro_gold/screens/home_screen.dart';
import 'package:oro_gold/screens/locker_contents_screen.dart';


class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case 'plan_screen':
        return MaterialPageRoute(builder: (_) => const ChoosePlanScreen());
      case 'locker':
        return MaterialPageRoute(builder: (_) => const LockerContentScreen());
      default:
        return null;
    }
  }
}
