import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/team_member.dart';

/// Provides access to the Firestore database storing [Meal] documents.
class TeamMemberDatabase {
  TeamMemberDatabase(this.ref);

  final ProviderRef<TeamMemberDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<TeamMember>> watchTeamMembers() => _service.watchCollection(
      path: FirestorePath.teamMembers(),
      builder: (data, documentId) => TeamMember.fromJson(data!));

  Stream<TeamMember> watchTeamMember(String teamMemberId) => _service.watchDocument(
      path: FirestorePath.teamMember(teamMemberId),
      builder: (data, documentId) => TeamMember.fromJson(data!));

  Future<List<TeamMember>> fetchTeamMembers() => _service.fetchCollection(
      path: FirestorePath.teamMembers(),
      builder: (data, documentId) => TeamMember.fromJson(data!));

  Future<TeamMember> fetchTeamMember(String teamMemberId) => _service.fetchDocument(
      path: FirestorePath.teamMember(teamMemberId),
      builder: (data, documentId) => TeamMember.fromJson(data!));
/*
  Future<void> setTeamMember(TeamMember teamMember) => _service.setData(
      path: FirestorePath.teamMember(teamMember.id), data: teamMember.toJson());

  Future<void> setTeamMemberDelayed(TeamMember teamMember) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.teamMember(teamMember.id), data: teamMember.toJson()));

  Future<void> setTeamMemberError(TeamMember teamMember) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteTeamMember(TeamMember teamMember) =>
      _service.deleteData(path: FirestorePath.teamMember(teamMember.id));
 */
}