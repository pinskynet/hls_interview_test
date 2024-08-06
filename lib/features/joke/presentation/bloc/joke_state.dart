// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'joke_bloc.dart';

abstract class JokeState extends Equatable {
  const JokeState();

  @override
  List<Object?> get props => [];
}

class JokeInitial extends JokeState {}

class JokeLoading extends JokeState {}

class JokeLoadSuccess extends JokeState {
  final List<JokeEntity> jokes;
  final int index;
  final bool? isLast;

  const JokeLoadSuccess({
    required this.jokes,
    required this.index,
    this.isLast,
  });

  @override
  List<Object?> get props => [jokes, index, isLast];

  JokeLoadSuccess copyWith({
    List<JokeEntity>? jokes,
    int? index,
    bool? isLast,
  }) {
    return JokeLoadSuccess(
      jokes: jokes ?? this.jokes,
      index: index ?? this.index,
      isLast: isLast ?? this.isLast,
    );
  }
}

class JokeLoadFailure extends JokeState {
  final String errMsg;

  const JokeLoadFailure({
    required this.errMsg,
  });

  @override
  List<Object> get props => [errMsg];
}
