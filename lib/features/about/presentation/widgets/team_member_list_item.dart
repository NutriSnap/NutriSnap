import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../domain/team_member.dart';

class TeamMemberListItem extends StatelessWidget {
  const TeamMemberListItem({
    Key? key,
    required this.teamMemberId,
  }) : super(key: key);

  final String teamMemberId;

  @override
  Widget build(BuildContext context) {
    TeamMember teamMember = teamMemberDB.getTeamMember(teamMemberId);
    String name = teamMember.name;
    String role = teamMember.role;
    String githubUrl = teamMember.githubUrl;
    String linkedinUrl = teamMember.linkedinUrl;
    return ListTile(
      title: Text(name, style: Theme.of(context).textTheme.titleLarge),
      subtitle: Text(role, style: Theme.of(context).textTheme.bodySmall),
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