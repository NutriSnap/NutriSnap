import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../views/camera/camera_page.dart';

class FAB extends StatelessWidget {
  const FAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(CameraPage.routeName);
      },
      backgroundColor: material3FlexScheme.light.primaryContainer,
      child: const Icon(
        Icons.camera_alt,
        color: Colors.black,
        size: 30,
      ),
    );
  }
}
