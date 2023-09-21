import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:nutrisnap/views/dashboard/dashboard_view.dart';
import 'package:nutrisnap/views/journal/journal_view.dart';
// ... (other imports)

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardView());
      case AppRoutes.journal:
        return MaterialPageRoute(builder: (_) => const JournalView());
      // ... (other routes)
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found!'),
        ),
      );
    });
  }
}
