import 'package:flutter/material.dart';

import 'widgets/food_category_trends.dart';
import 'widgets/individual_user_stats.dart';
import 'widgets/logging_frequency_trends.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);
  static const routeName = '/admin';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FoodCategoryTrends(),
              SizedBox(height: 8),
              LoggingFrequencyTrends(),
              SizedBox(height: 8),
              IndividualUserStats()
            ],
          ),
        )
    );
  }
}
