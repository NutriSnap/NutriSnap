import 'package:nutrisnap/features/snaps/domain/image_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutrisnap/features/snaps/data/image_database.dart';
part 'image_provider.g.dart';

@riverpod
ImageDatabase imageDatabase(ImageDatabaseRef ref) {
  return ImageDatabase(ref);
}

@riverpod
Stream<List<Image>> images(ImagesRef ref) {
  final database = ref.watch(imageDatabaseProvider);
  return database.watchImages();
}