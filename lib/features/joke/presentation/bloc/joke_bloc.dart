import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hls_interview_test/features/joke/data/datasources/local/joke_local_data_source.dart';
import 'package:hls_interview_test/features/joke/data/repositories/joke_repository_impl.dart';
import 'package:hls_interview_test/features/joke/domain/entities/joke_entity.dart';
import 'package:hls_interview_test/features/joke/domain/usecases/joke_vote_use_case.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final jokeUseCase = JokeUseCase(
      JokeRepositoryImpl(jokeLocalDataSource: JokeLocalDataSourceImpl()));

  JokeBloc() : super(JokeInitial()) {
    on<JokeViewLoaded>(_onJokeViewLoaded);
    on<JokeVote>(_onJokeVote);
  }

  FutureOr<void> _onJokeViewLoaded(
      JokeViewLoaded event, Emitter<JokeState> emit) {
    var jokes = const [
      JokeEntity(
        id: 1,
        description:
            'A child asked his father, "How were people born?" So his father said, "Adam and Eve made babies, then their babies became adults and made babies, and so on." The child then went to his mother, asked her the same question and she told him, "We were monkeys then we evolved to become like we are now." The child ran back to his father and said, "You lied to me!" His father replied, "No, your mom was talking about her side of the family."',
        isFunny: false,
      ),
      JokeEntity(
        id: 2,
        description:
            'Teacher: "Kids,what does the chicken give you?" Student: "Meat!" Teacher: "Very good! Now what does the pig give you?" Student: "Bacon!" Teacher: "Great! And what does the fat cow give you?" Student: "Homework!"',
        isFunny: false,
      ),
      JokeEntity(
        id: 3,
        description:
            'The teacher asked Jimmy, "Why is your cat at school today Jimmy?" Jimmy replied crying, "Because I heard my daddy tell my mommy, \'I am going to eat that pussy once Jimmy leaves for school today!\'"',
        isFunny: false,
      ),
      JokeEntity(
        id: 4,
        description:
            'A housewife, an accountant and a lawyer were asked "How much is 2+2?" The housewife replies: "Four!". The accountant says: "I think it\'s either 3 or 4. Let me run those figures through my spreadsheet one more time." The lawyer pulls the drapes, dims the lights and asks in a hushed voice, "How much do you want it to be?"',
        isFunny: false,
      ),
    ];

    emit(JokeLoadSuccess(jokes: jokes, index: 0));
  }

  FutureOr<void> _onJokeVote(JokeVote event, Emitter<JokeState> emit) {
    final currentState = state;

    if (currentState is JokeLoadSuccess) {
      final jokes = currentState.jokes;
      final index = currentState.index;

      _saveJoke(jokes, index, event.isFunny);

      if (index == jokes.length - 1) {
        emit(const JokeLoadFailure(
            errMsg: 'That\'s all the jokes for today! Come back another day!'));
        emit(currentState);
      } else {
        emit(currentState.copyWith(index: currentState.index + 1));
      }
    }
  }

  void _saveJoke(List<JokeEntity> jokes, int index, bool isFunny) {
    final joke = jokes[index].copyWith(isFunny: isFunny);
    jokeUseCase.execute(joke: joke);
  }
}
