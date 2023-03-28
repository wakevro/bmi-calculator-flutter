import 'package:bmicalculator/router/routes.dart';
import 'package:bmicalculator/views/home_view.dart';
import 'package:bmicalculator/views/result_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case resultRoute:
        return MaterialPageRoute(
            builder: (_) => const ResultView(), settings: routeSettings);
      default:
        return MaterialPageRoute(
            builder: (_) => const HomeView(), settings: routeSettings);
    }
  }
}
