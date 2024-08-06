import 'package:hls_interview_test/features/joke/data/datasources/local/collections/joke_collection.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalDatabase {
  

  late Future<Isar> db;

  LocalDatabase() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();

      return await Isar.open(
        _schemas,
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}

const _schemas = <CollectionSchema<dynamic>>[JokeCollectionSchema];
