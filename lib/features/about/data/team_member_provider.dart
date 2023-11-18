import 'package:nutrisnap/features/about/data/team_member_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/team_member.dart';

part 'team_member_provider.g.dart';

@riverpod
TeamMemberDatabase teamMemberDatabase(TeamMemberDatabaseRef ref) {
  return TeamMemberDatabase(ref);
}

@riverpod
Stream<List<TeamMember>> teamMembers(TeamMembersRef ref) {
  final database = ref.watch(teamMemberDatabaseProvider);
  return database.watchTeamMembers();
}