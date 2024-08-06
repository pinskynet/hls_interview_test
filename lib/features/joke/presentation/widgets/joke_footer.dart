import 'package:flutter/material.dart';

class FooterW extends StatelessWidget {
  const FooterW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
            text:
                'This app is created as part of HL solutions program. The materials contained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the information contained on this site.\n\n',
            style: TextStyle(color: Color(0xff969696)),
            children: [
              TextSpan(
                text: 'Copyright 2021 HLS',
                style: TextStyle(
                  color: Color(0xff646464),
                  fontSize: 20,
                ),
              ),
            ]),
      ),
    );
  }
}
