import 'package:flutter/material.dart';
import 'routing/routes.dart';
import 'shared/themes.dart';
import 'routing/route_generator.dart';

void main() => runApp(const NutriSnapApp());

class NutriSnapApp extends StatelessWidget {
  const NutriSnapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriSnap',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      initialRoute: AppRoutes.dashboard,
      onGenerateRoute:
          RouteGenerator.generateRoute, // If you use a route generator
    );
  }
}
