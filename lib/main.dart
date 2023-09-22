import 'package:flutter/material.dart';
import 'package:nutrisnap/routing/route_generator.dart';
import 'shared/themes.dart';
import 'core/constants/colors.dart';

void main() => runApp(const NutriSnapApp());

class NutriSnapApp extends StatelessWidget {
  const NutriSnapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriSnap',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

// class NutriSnapApp extends StatefulWidget {
//   const NutriSnapApp({super.key});

//   @override
//   State<NutriSnapApp> createState() => _NutriSnapAppState();
// }

// class _NutriSnapAppState extends State<NutriSnapApp> {
//   bool useMaterial3 = true;
//   ThemeMode themeMode = ThemeMode.system;
//   ColorSeed colorSelected = ColorSeed.baseColor;
//   ColorImageProvider imageSelected = ColorImageProvider.leaves;
//   ColorScheme? imageColorScheme = const ColorScheme.light();
//   ColorSelectionMethod colorSelectionMethod = ColorSelectionMethod.colorSeed;

//   bool get useLightMode {
//     switch (themeMode) {
//       case ThemeMode.system:
//         return View.of(context).platformDispatcher.platformBrightness ==
//             Brightness.light;
//       case ThemeMode.light:
//         return true;
//       case ThemeMode.dark:
//         return false;
//     }
//   }

//   void handleBrightnessChange(bool useLightMode) {
//     setState(() {
//       themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
//     });
//   }

//   // void handleMaterialVersionChange() {
//   //   setState(() {
//   //     useMaterial3 = !useMaterial3;
//   //   });
//   // }

//   void handleColorSelect(int value) {
//     setState(() {
//       colorSelectionMethod = ColorSelectionMethod.colorSeed;
//       colorSelected = ColorSeed.values[value];
//     });
//   }

//   void handleImageSelect(int value) {
//     final String url = ColorImageProvider.values[value].url;
//     ColorScheme.fromImageProvider(provider: NetworkImage(url))
//         .then((newScheme) {
//       setState(() {
//         colorSelectionMethod = ColorSelectionMethod.image;
//         imageSelected = ColorImageProvider.values[value];
//         imageColorScheme = newScheme;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Material 3',
//       themeMode: themeMode,
//       theme: ThemeData(
//         colorSchemeSeed: colorSelectionMethod == ColorSelectionMethod.colorSeed
//             ? colorSelected.color
//             : null,
//         colorScheme: colorSelectionMethod == ColorSelectionMethod.image
//             ? imageColorScheme
//             : null,
//         useMaterial3: useMaterial3,
//         brightness: Brightness.light,
//       ),
//       darkTheme: ThemeData(
//         colorSchemeSeed: colorSelectionMethod == ColorSelectionMethod.colorSeed
//             ? colorSelected.color
//             : imageColorScheme!.primary,
//         useMaterial3: true,
//         brightness: Brightness.dark,
//       ),
//       initialRoute: '/',
//       onGenerateRoute: RouteGenerator.generateRoute,

//       // home: Home(
//       //   useLightMode: useLightMode,
//       //   useMaterial3: useMaterial3,
//       //   colorSelected: colorSelected,
//       //   imageSelected: imageSelected,
//       //   handleBrightnessChange: handleBrightnessChange,
//       //   handleMaterialVersionChange: handleMaterialVersionChange,
//       //   handleColorSelect: handleColorSelect,
//       //   handleImageSelect: handleImageSelect,
//       //   colorSelectionMethod: colorSelectionMethod,
//       // ),
//     );
//   }
// }
