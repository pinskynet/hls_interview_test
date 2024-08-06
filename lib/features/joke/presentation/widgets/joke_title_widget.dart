import 'package:flutter/material.dart';

class TitleJokeW extends StatelessWidget {
  const TitleJokeW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: const Color(0xff29b363),
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: 'A joke a day keeps the doctor away\n\n',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: 'If you joke wrong way, your teeth have to play. (Serious)',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
