import 'package:flutter/material.dart';
import 'package:nutrisnap/views/about/presentation/widgets/app_feature.dart';
import 'package:nutrisnap/views/about/presentation/widgets/section_header.dart';
import 'package:nutrisnap/views/about/presentation/widgets/team_member_grid.dart';
import 'package:url_launcher/link.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // App Logo or Banner image here (if you have one)
          const SectionHeader(title: "About NutriSnap"),
          const SizedBox(height: 12),
          const Text(
              "Transform your meals into nutritional insights through intelligent, camera-powered food logging."),

          const SizedBox(height: 12),
          // Banner Image
          Image.asset(
            'assets/images/layout/banner.png',
            width: MediaQuery.of(context)
                .size
                .width, // makes sure it scales across the width of the screen
            fit: BoxFit
                .cover, // makes sure it scales while maintaining its aspect ratio
          ),
          const SizedBox(height: 12),

          // Other Sections
          const SectionHeader(title: "Features"),
          const AppFeature(featureText: "Smart food recognition"),
          const AppFeature(featureText: "Comprehensive nutrition tracking"),
          const AppFeature(featureText: "Customizable nutrition goals"),
          // ... Additional features can go here
          const Divider(
            // Add a line to separate sections
            thickness: 1,
          ),
          Link(
            uri: Uri.parse('https://nutrisnap.github.io'),
            target: LinkTarget.blank,
            builder: (BuildContext ctx, FollowLink? openLink) {
              return TextButton.icon(
                onPressed: openLink,
                label: const Text('Documentation'),
                icon: const Icon(Icons.read_more),
              );
            },
          ),
          // Team members
          const SectionHeader(title: "Meet the Team"),
          const TeamMemberGrid(),
        ],
      ),
    );
  }
}