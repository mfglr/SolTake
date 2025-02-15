import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/create_solution_by_ai/extract_video_frame_page/widgets/catch_frame_button/catch_frame_button_texts.dart';

class CatchFrameButton extends StatelessWidget {
  final void Function() onPressed;
  const CatchFrameButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(128),
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              buttonContent[getLanguage(context)]!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
            const Icon(
              Icons.crop,
              color: Colors.white,
              size: 25,
            )
          ],
        )
      ),
    );
  }
}