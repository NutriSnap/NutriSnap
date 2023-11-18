import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/features/about/domain/team_member.dart';
import 'package:nutrisnap/features/about/presentation/widgets/team_member_list_item.dart';

import '../../../ns_error.dart';
import '../../../ns_loading.dart';
import '../../data/team_member_provider.dart';
import '../../domain/team_member_collection.dart';

/*
List<TeamMemberListItem> _buildListItems(BuildContext context) {
  //List<String> teamMemberIds = teamMemberDB.getTeamMemberIds();

  if (teamMembers.isEmpty) {
    return const <TeamMemberListItem>[];
  }

  return teamMemberIds.map((teamMemberId) {
    return TeamMemberListItem(teamMemberId: teamMemberId);
  }).toList();
}
 */

class TeamMemberGrid extends ConsumerWidget {
  const TeamMemberGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    return ListView(
      //crossAxisCount: 1, // how many columns
      //itemCount: teamMemberDB.getTeamMemberIds().length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0), // padding around the grid
      //itemBuilder: TeamMemberListItem(),
      //childAspectRatio: 16.0 / 9.0, // width to height ratio
      //children: _buildListItems(context), // List of SnapCard widgets
      children: [
        ...teamMemberCollection
            .getTeamMembers()
            .map((teamMember) => TeamMemberListItem(teamMember: teamMember))
      ],
    );
  }
}