//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutrisnap/features/snaps/data/snap_database.dart';
import '../domain/snap.dart';
part 'snap_provider.g.dart';

@riverpod
SnapDatabase snapDatabase(SnapDatabaseRef ref) {
  return SnapDatabase(ref);
}

@riverpod
Stream<List<Snap>> snaps(SnapsRef ref) {
  final database = ref.watch(snapDatabaseProvider);
  return database.watchSnaps();
}

/*
final snapDBProvider = Provider<SnapDB>((ref) {
  return SnapDB(ref);
});
 */