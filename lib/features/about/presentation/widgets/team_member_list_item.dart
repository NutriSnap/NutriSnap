import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/link.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../ns_error.dart';
import '../../../ns_loading.dart';
import '../../data/team_member_provider.dart';
import '../../domain/team_member.dart';
import '../../domain/team_member_collection.dart';

class TeamMemberListItem extends ConsumerWidget {
  const TeamMemberListItem({Key? key, required this.teamMember}) : super(key: key);

  final TeamMember teamMember;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TeamMember teamMember = teamMemberDB.getTeamMember(teamMemberId);
    /*
    String name = teamMember.name;
    String role = teamMember.role;
    String githubUrl = teamMember.githubUrl;
    String linkedinUrl = teamMember.linkedinUrl;
     */
    final teamMembers = ref.watch(teamMembersProvider);
    return teamMembers.when(
        data: (teamMembers) => _build(
            context: context,
            teamMembers: teamMembers),
        loading: () => const NSLoading(),
        error: (error, st) => NSError(error.toString(), st.toString()));
  }
  Widget _build(
      {required BuildContext context,
        required List<TeamMember> teamMembers}) {
    TeamMemberCollection teamMemberCollection = TeamMemberCollection(teamMembers);
    //TeamMember teamMember = teamMemberCollection.getTeamMember(teamMemberId);
    return ListTile(
      title: Text(teamMember.name, style: Theme.of(context).textTheme.titleLarge),
      subtitle: Text(teamMember.role, style: Theme.of(context).textTheme.bodySmall),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Link(
            uri: Uri.parse(teamMember.githubUrl),
            target: LinkTarget.blank,
            builder: (BuildContext ctx, FollowLink? openLink) {
              return IconButton(
                onPressed: openLink,
                icon: const FaIcon(FontAwesomeIcons.github),
              );
            },
          ),
          Link(
            uri: Uri.parse(teamMember.linkedinUrl),
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