import 'package:flutter/material.dart';
// import 'package:nutrisnap/common/widgets/placeholder_widget.dart';
import 'widgets/line_chart.dart';

class TrendsPage extends StatelessWidget {
  const TrendsPage({Key? key}) : super(key: key);
  static const routeName = '/trends';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Food Category Trends',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FoodCategoryTrendsChart(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Logging Trends',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text('Make a calendar-based logging chart here'),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'widgets/line_chart.dart';

// class TrendsScreen extends StatelessWidget {
//   const TrendsScreen({Key? key}) : super(key: key);

//   static const String routeName = '/trends';

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 20),
//               child: Text(
//                 'Food Category Trends',
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             FoodCategoryTrendsChart(),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 20),
//               child: Text(
//                 'Logging Trends',
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Text('Make a calendar-based logging chart here'),
//           ],
//         ),
//       ),
//     );
//   }
// }