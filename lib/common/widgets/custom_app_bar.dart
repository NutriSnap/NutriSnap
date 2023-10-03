import 'package:flutter/material.dart';
import 'package:nutrisnap/core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green,
              Colors.yellow,
            ],
          ),
        ),
      ),
      title: const Text('NutriSnap',
          style: TextStyle(
              color: AppColors.charcoal,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'Montserrat')),
      leading: IconButton(
        icon: const Icon(Icons.menu, color: AppColors.charcoal),
        onPressed: () {
          // Logic to open a drawer or navigation menu
          Navigator.pushNamed(context, '/about');
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.book_outlined, color: AppColors.charcoal),
          onPressed: () {
            // Logic for the book_icon
            Navigator.pushNamed(context, '/journal');
          },
        ),
        IconButton(
          icon: const Icon(Icons.home_outlined, color: AppColors.charcoal),
          onPressed: () {
            // Logic for the home_icon
            Navigator.pushNamed(context, '/home');
          },
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: IconButton(
            icon: const Icon(Icons.account_circle_outlined,
                color: AppColors.charcoal),
            onPressed: () {
              // Logic to navigate to profile or other user-related actions
            },
          ),
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 2.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
