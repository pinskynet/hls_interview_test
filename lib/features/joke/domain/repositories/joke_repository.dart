import 'package:hls_interview_test/features/joke/domain/entities/joke_entity.dart';

abstract class JokeRepository {
  Future<void> jokeVote(JokeEntity joke);
}
