class TeamMember {
  TeamMember({
    required this.id,
    required this.name,
    required this.role,
    required this.githubUrl,
    required this.linkedinUrl,
  });

  String id;
  String name;
  String role;
  String githubUrl;
  String linkedinUrl;
}

class TeamMemberDB {
  final List<TeamMember> _teamMembers = [
    TeamMember(
      id: '1',
      name: 'Lydia Sollis',
      role: 'Team Lead\nStudent, MSc Computer Science\nFull Stack Developer',
      githubUrl: 'https://github.com/lsollis/',
      linkedinUrl: 'https://www.linkedin.com/in/lydia-sollis/'),
    TeamMember(
      id: '2',
      name: 'Michael Rogers',
      role: 'Student, MSc Computer Science\nFrontend Developer',
  githubUrl: 'https://github.com/mlr77',
  linkedinUrl:
  'https://www.linkedin.com/in/michael-rogers-a2a1152a/'),
    TeamMember(
      id: '3',
      name: 'Jingyi He',
      role: 'Student, BS Computer Science\nQ/A Engineer',
  githubUrl: "https://github.com/jing2003",
  linkedinUrl: "https://www.linkedin.com/in/jingyi-he-b16b0222b/",
  ),
  ];

  TeamMember getTeamMember(String teamMemberid) {
    return _teamMembers.firstWhere((teamMember) => teamMember.id == teamMemberid);
  }

  List<TeamMember> get badges {
    return [..._teamMembers];
  }

  List<String> getTeamMemberIds() {
    return _teamMembers.map((teamMember) => teamMember.id).toList();
  }

}

TeamMemberDB teamMemberDB = TeamMemberDB();