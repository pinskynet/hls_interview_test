// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hls_interview_test/features/joke/domain/entities/joke_entity.dart';
import 'package:hls_interview_test/features/joke/presentation/bloc/joke_bloc.dart';
import 'package:hls_interview_test/score/widgets/my_button_widget.dart';

class BodyJokeW extends StatelessWidget {
  const BodyJokeW({
    super.key,
    required this.joke,
  });

  final JokeEntity joke;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<JokeBloc>(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffebebeb),
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Text(
              joke.description,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButtonW(
                onPressed: () {
                  bloc.add(const JokeVote(isFunny: true));
                },
                label: 'This is Funny!',
                color: const Color(0xff2c7edb),
              ),
              MyButtonW(
                onPressed: () {
                  bloc.add(const JokeVote(isFunny: false));
                },
                label: 'This is not funny.',
                color: const Color(0xff29b363),
              ),
            ],
          )
        ],
      ),
    );
  }
}
