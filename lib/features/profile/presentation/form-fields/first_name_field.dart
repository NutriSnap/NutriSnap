import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'field_padding.dart';

/// A text field to input garden photo file name found in images subdirectory.
class FirstNameField extends StatelessWidget {
  const FirstNameField({super.key, required this.fieldKey, this.currfirstName});

  final String? currfirstName;
  final GlobalKey<FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>>
      fieldKey;

  @override
  Widget build(BuildContext context) {
    String fieldName = 'First Name';
    return FieldPadding(
      child: FormBuilderTextField(
        name: fieldName,
        key: fieldKey,
        initialValue: currfirstName,
        decoration: InputDecoration(
          labelText: fieldName,
          hintText: 'Example: John',
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
      ),
    );
  }
}
