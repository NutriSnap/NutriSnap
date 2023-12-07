// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Customize the Header section of the Signin page.
HeaderBuilder headerImage(String assetName) {
  return (context, constraints, _) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(0),
          child: Image.asset(assetName, height: 200),
        ),
      ],
    );
  };
}

/// Customize the icon displayed in the Header.
HeaderBuilder headerIcon(IconData icon) {
  return (context, constraints, shrinkOffset) {
    return Padding(
      padding: const EdgeInsets.all(10).copyWith(top: 20),
      child: Icon(
        icon,
        color: Colors.green,
        size: constraints.maxWidth / 4 * (1 - shrinkOffset),
      ),
    );
  };
}

/// Customize the side image.
SideBuilder sideImage(String assetName) {
  return (context, constraints) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(constraints.maxWidth / 4),
        child: Image.asset(assetName),
      ),
    );
  };
}

/// Customize the side icon
SideBuilder sideIcon(IconData icon) {
  return (context, constraints) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Icon(
        icon,
        color: Colors.green,
        size: constraints.maxWidth / 3,
      ),
    );
  };
}

class SquareButton extends StatelessWidget {
  final String iconPath;
  const SquareButton({
    Key? key,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          iconPath,
          height: 48,
          width: 48,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
