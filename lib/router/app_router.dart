import 'package:bmicalculator/views/home/home_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
    
      default:
        return MaterialPageRoute(builder: (_) => const HomeView(), settings: routeSettings);
    }
  }
}
