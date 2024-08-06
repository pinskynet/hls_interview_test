// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hls_interview_test/features/joke/data/datasources/local/collections/joke_collection.dart';
import 'package:hls_interview_test/features/joke/data/datasources/local/joke_local_data_source.dart';
import 'package:hls_interview_test/features/joke/domain/entities/joke_entity.dart';
import 'package:hls_interview_test/features/joke/domain/repositories/joke_repository.dart';

class JokeRepositoryImpl implements JokeRepository {
  final JokeLocalDataSource jokeLocalDataSource;

  JokeRepositoryImpl({
    required this.jokeLocalDataSource,
  });

  @override
  Future<void> jokeVote(JokeEntity joke) async {
    jokeLocalDataSource.saveJoke(
      JokeCollection(
        id: joke.id,
        description: joke.description,
        isFunny: joke.isFunny,
      ),
    );
  }
}
