import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({super.key, required this.values});

  final List<String> values;

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    // Initialize dropdownValue with the first value from the widget's values list
    dropdownValue = widget.values.isNotEmpty ? widget.values.first : '';
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      //width: 250,
      initialSelection: dropdownValue,
      onSelected: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      dropdownMenuEntries: widget.values.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
        );
      }).toList(),
    );
  }
}
