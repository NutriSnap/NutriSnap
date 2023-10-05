import 'package:flutter/material.dart';
import 'package:nutrisnap/views/snaps/snaps_page.dart';
import 'package:nutrisnap/views/snaps/widgets/meal_dropdown_menu.dart';

class SnapsEditPage extends StatefulWidget {
  const SnapsEditPage({super.key});

  static const String routeName = '/snapsEdit';

  @override
  State<SnapsEditPage> createState() => _SnapsEditPageState();
}

class _SnapsEditPageState extends State<SnapsEditPage> {
  // image
  static const String _image = 'assets/images/layout/foodplaceholder.png';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Show the image from the assets folder
          Image.asset(_image),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: MealDropdownMenu(),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Food 1',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Food 2',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Food 3',
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                // save the snap
              },
              child:
                  const Text('Discard', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                // save the snap
                // Navigator.of(context).pop();
                Navigator.of(context).pushNamed(SnapsPage.routeName);
              },
              child: const Text('Save'),
            ),
          ]),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:nutrisnap/views/snaps/widgets/meal_dropdown_menu.dart';

// class SnapsEditPage extends StatefulWidget {
//   const SnapsEditPage({super.key});

//   static const String routeName = '/snapsEdit';

//   @override
//   State<SnapsEditPage> createState() => _SnapsState();
// }

// class _SnapsState extends State<SnapsEditPage> {
//   // image
//   static const String _image = 'assets/images/layout/foodplaceholder.png';

//   void _snapPicture() {
//     setState(() {
//       // save the image and display it
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // gradiant background
//         backgroundColor: Colors.transparent,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: <Color>[
//                 Color(0xFF13E3D2),
//                 Color(0xFF5D74E2),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         title: const Text(
//           'Snaps',
//           style: TextStyle(
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             // Show the image from the assets folder
//             Image.asset(_image),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: MealDropdownMenu(),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Food 1',
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Food 2',
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Food 3',
//                 ),
//               ),
//             ),
//             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(32.0),
//                   ),
//                 ),
//                 onPressed: () {
//                   // save the snap
//                 },
//                 child: const Text('Discard',
//                     style: TextStyle(color: Colors.white)),
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(32.0),
//                   ),
//                 ),
//                 onPressed: () {
//                   // save the snap
//                   Navigator.of(context).pop();
//                   Navigator.pushNamed(context, '/snaps');
//                 },
//                 child: const Text('Save'),
//               ),
//             ]),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _snapPicture,
//         tooltip: 'Increment',
//         child: const Icon(Icons.camera_alt_rounded,
//             color: Colors.black87, size: 40),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//       // bottomNavigationBar: const NavigationDrawer(),
//     );
//   }
// }
