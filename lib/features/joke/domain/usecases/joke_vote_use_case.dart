import 'package:hls_interview_test/features/joke/domain/entities/joke_entity.dart';
import 'package:hls_interview_test/features/joke/domain/repositories/joke_repository.dart';

class JokeUseCase {
  final JokeRepository _postRepository;

  JokeUseCase(this._postRepository);

  Future<void> execute({required JokeEntity joke}) {
    return _postRepository.jokeVote(joke);
  }
}
