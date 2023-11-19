import 'team_member.dart';

class TeamMemberCollection {
  TeamMemberCollection(teamMembers) : _teamMembers = teamMembers;

  final List<TeamMember> _teamMembers;

  List<TeamMember> get meals => _teamMembers;
/*
  TeamMember getTeamMember(String id) {
    return _teamMembers.firstWhere((teamMember) => teamMember.id == id);
  }

  List<String> getTeamMemberIds() {
    return _teamMembers.map((teamMember) => teamMember.id).toList();
  }
*/
  List<TeamMember> getTeamMembers() {
    return _teamMembers.toList();
  }
}
