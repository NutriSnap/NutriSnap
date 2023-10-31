import 'package:flutter/material.dart';
import 'package:nutrisnap/data_models/team_member.dart';
import 'package:nutrisnap/views/about/presentation/widgets/team_member_list_item.dart';

List<TeamMemberListItem> _buildListItems(BuildContext context) {
  List<String> teamMemberIds = teamMemberDB.getTeamMemberIds();

  if (teamMemberIds.isEmpty) {
    return const <TeamMemberListItem>[];
  }

  return teamMemberIds.map((teamMemberId) {
    return TeamMemberListItem(teamMemberId: teamMemberId);
  }).toList();
}

class TeamMemberGrid extends StatelessWidget {
  const TeamMemberGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      //crossAxisCount: 1, // how many columns
      //itemCount: teamMemberDB.getTeamMemberIds().length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0), // padding around the grid
      //itemBuilder: TeamMemberListItem(),
      //childAspectRatio: 16.0 / 9.0, // width to height ratio
      children: _buildListItems(context), // List of SnapCard widgets
    );
  }
}