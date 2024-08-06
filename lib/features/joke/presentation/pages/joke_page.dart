import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hls_interview_test/features/joke/presentation/bloc/joke_bloc.dart';
import 'package:hls_interview_test/features/joke/presentation/widgets/joke_body_widget.dart';
import 'package:hls_interview_test/features/joke/presentation/widgets/joke_footer.dart';
import 'package:hls_interview_test/features/joke/presentation/widgets/joke_header_widget.dart';
import 'package:hls_interview_test/features/joke/presentation/widgets/joke_title_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<JokeBloc>(
          create: (context) => JokeBloc()..add(JokeViewLoaded()),
          child: BlocListener<JokeBloc, JokeState>(
            listener: (context, s) {
              if (s is JokeLoadFailure) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('No more jokes'),
                      content: Text(s.errMsg),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: BlocBuilder<JokeBloc, JokeState>(
              builder: (context, s) {
                if (s is JokeLoadSuccess) {
                  return Column(
                    children: [
                      const HeaderW(),
                      const TitleJokeW(),
                      Expanded(
                        child: BodyJokeW(
                          joke: s.jokes[s.index],
                        ),
                      ),
                      const FooterW(),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
