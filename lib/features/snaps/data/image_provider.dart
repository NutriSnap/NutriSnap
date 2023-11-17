import 'package:nutrisnap/features/snaps/domain/snap_image.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutrisnap/features/snaps/data/image_database.dart';
part 'image_provider.g.dart';

@riverpod
SnapImageDatabase snapImageDatabase(SnapImageDatabaseRef ref) {
  return snapImageDatabase(ref);
}

@riverpod
Stream<List<SnapImage>> snapImages(SnapImagesRef ref) {
  final database = ref.watch(snapImageDatabaseProvider);
  return database.watchSnapImages();
}