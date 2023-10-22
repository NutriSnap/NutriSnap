import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeamMember extends StatelessWidget {
  const TeamMember({
    Key? key,
    required this.name,
    required this.role,
    required this.githubUrl,
    required this.linkedinUrl,
  }) : super(key: key);

  final String name;
  final String role;
  final String githubUrl;
  final String linkedinUrl;

  @override
  Widget build(BuildContext context) {
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