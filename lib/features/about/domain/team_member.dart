import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'team_member.freezed.dart';
part 'team_member.g.dart';

@freezed
class TeamMember with _$TeamMember {
  const factory TeamMember({
    required String name,
    required String role,
    required String githubUrl,
    required String linkedinUrl,
  }) = _TeamMember;

  factory TeamMember.fromJson(Map<String, dynamic> json) => _$TeamMemberFromJson(json);

  static Future<List<TeamMember>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/meals.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => TeamMember.fromJson(jsonData)).toList();
  }
}

/*
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

 */