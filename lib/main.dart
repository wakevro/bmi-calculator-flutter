import 'package:bmicalculator/router/app_router.dart';
import 'package:bmicalculator/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final AppRouter appRouter = AppRouter();
  runApp(MaterialApp(
    title: "BMI Calculator",
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    onGenerateRoute: appRouter.onGenerateRoute,
    debugShowCheckedModeBanner: false,
    home: const HomeView(),
  ));
}
