// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'joke_bloc.dart';

abstract class JokeEvent extends Equatable {
  const JokeEvent();

  @override
  List<Object> get props => [];
}

class JokeViewLoaded extends JokeEvent {}

class JokeVote extends JokeEvent {
  final bool isFunny;

  const JokeVote({
    required this.isFunny,
  });

  @override
  List<Object> get props => [isFunny];
}
