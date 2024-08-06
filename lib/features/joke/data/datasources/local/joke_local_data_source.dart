import 'package:hls_interview_test/features/joke/data/datasources/local/collections/joke_collection.dart';
import 'package:hls_interview_test/score/database/local_database.dart';
import 'package:isar/isar.dart';

abstract class JokeLocalDataSource {
  Future<bool> saveJoke(JokeCollection jokeCollection);
}

class JokeLocalDataSourceImpl implements JokeLocalDataSource {
  final localDatabase = LocalDatabase();

  @override
  Future<bool> saveJoke(JokeCollection jokeCollection) async {
    try {
      final db = await localDatabase.db;

      await db.writeTxn(() async => db.jokeCollections.put(jokeCollection));

      return true;
    } on IsarError {
      rethrow;
    }
  }
}
