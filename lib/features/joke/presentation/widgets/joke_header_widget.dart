import 'package:flutter/material.dart';
import 'package:hls_interview_test/score/constants/assets_path.dart';

class HeaderW extends StatelessWidget {
  const HeaderW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            const Image(
              image: AssetImage(AssetsPath.logo),
              fit: BoxFit.cover,
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Handicrafted by',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
                const Text(
                  'Jim HLS',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            const CircleAvatar(
              foregroundImage: NetworkImage(
                'https://store.playstation.com/store/api/chihiro/00_09_000/container/US/en/19/UP2477-CUSA06694_00-AV00000000000161/image?w=320&h=320&bg_color=000000&opacity=100&_version=00_09_000',
              ),
              child: Icon(Icons.person),
            )
          ],
        ),
      ),
    );
  }
}
