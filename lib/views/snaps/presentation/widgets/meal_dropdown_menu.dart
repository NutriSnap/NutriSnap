import 'package:flutter/material.dart';

const List<String> meals = <String>['Breakfast', 'Morning Snack', 'Lunch', 'Afternoon Snack', 'Dinner', 'Dessert'];

class MealDropdownMenu extends StatefulWidget {
  const MealDropdownMenu({Key? key}) : super(key: key);

  @override
  State<MealDropdownMenu> createState() => _MealDropdownMenuState();
}

class _MealDropdownMenuState extends State<MealDropdownMenu> {
  String dropdownValue = meals.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: meals.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: meals.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}