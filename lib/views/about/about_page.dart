// import 'package:flutter/material.dart';
// import 'package:url_launcher/link.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class AboutPage extends StatelessWidget {
//   const AboutPage({Key? key}) : super(key: key);

//   static const routeName = '/about';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           const Text(
//             "NutriSnap",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//               "Transform your meals into nutritional insights through intelligent, camera-powered food logging."),
//           const Divider(),
//           Link(
//             uri: Uri.parse('https://nutrisnap.github.io'),
//             target: LinkTarget.blank,
//             builder: (BuildContext ctx, FollowLink? openLink) {
//               return TextButton.icon(
//                 onPressed: openLink,
//                 label: const Text('Documentation'),
//                 icon: const Icon(Icons.read_more),
//               );
//             },
//           ),
//           const Divider(),
//           const Text(
//             "About Us",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           _buildTeamMember(
//             name: "Lydia Sollis",
//             role: "Team Lead",
//             githubUrl: "https://github.com/lsollis/",
//             linkedinUrl: "https://www.linkedin.com/in/lydia-sollis/",
//           ),
//           // ... More team members
//         ],
//       ),
//     );
//   }

//   Widget _buildTeamMember({
//     required String name,
//     required String role,
//     required String githubUrl,
//     required String linkedinUrl,
//   }) {
//     return ListTile(
//       title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
//       subtitle: Text(role),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Link(
//             uri: Uri.parse(githubUrl),
//             target: LinkTarget.blank,
//             builder: (BuildContext ctx, FollowLink? openLink) {
//               return IconButton(
//                 onPressed: openLink,
//                 icon: const FaIcon(FontAwesomeIcons.github),
//                 color: Colors.black,
//               );
//             },
//           ),
//           Link(
//             uri: Uri.parse(linkedinUrl),
//             target: LinkTarget.blank,
//             builder: (BuildContext ctx, FollowLink? openLink) {
//               return IconButton(
//                 onPressed: openLink,
//                 icon: const FaIcon(FontAwesomeIcons.linkedin),
//                 color: Colors.blue,
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          const Text(
            "About NutriSnap",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
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
          _buildSectionHeader("Features"),
          _buildFeature("Smart food recognition"),
          _buildFeature("Comprehensive nutrition tracking"),
          _buildFeature("Customizable nutrition goals"),
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
          _buildSectionHeader("Meet the Team"),
          _buildTeamMember(
            name: "Lydia Sollis",
            role:
                "Team Lead\nStudent, MSc Computer Science\nFull Stack Developer",
            githubUrl: "https://github.com/lsollis/",
            linkedinUrl: "https://www.linkedin.com/in/lydia-sollis/",
          ),
          _buildTeamMember(
            name: "Michael Rogers",
            role: "Student, MSc Computer Science\nFrontend Developer",
            githubUrl: "https://github.com/mlr77",
            linkedinUrl: "https://www.linkedin.com/in/michael-rogers-a2a1152a/",
          ),
          _buildTeamMember(
            name: "Jingyi He",
            role: "Student, BS Computer Science\nQ/A Engineer",
            githubUrl: "https://github.com/jing2003",
            linkedinUrl: "https://www.linkedin.com/in/jingyi-he-b16b0222b/",
          ),
          // ... More team members
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildFeature(String featureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        "• $featureText",
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildTeamMember({
    required String name,
    required String role,
    required String githubUrl,
    required String linkedinUrl,
  }) {
    return ListTile(
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(role),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Link(
            uri: Uri.parse(githubUrl),
            target: LinkTarget.blank,
            builder: (BuildContext ctx, FollowLink? openLink) {
              return IconButton(
                onPressed: openLink,
                icon: const FaIcon(FontAwesomeIcons.github),
                color: Colors.black,
              );
            },
          ),
          Link(
            uri: Uri.parse(linkedinUrl),
            target: LinkTarget.blank,
            builder: (BuildContext ctx, FollowLink? openLink) {
              return IconButton(
                onPressed: openLink,
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                color: Colors.blue,
              );
            },
          ),
        ],
      ),
    );
  }
}
