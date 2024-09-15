import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImageNotFoundWidget extends StatelessWidget {
  const ImageNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.cancel_outlined,
            size: 40,
          ),
          Text(
            AppLocalizations.of(context)!.image_not_font_widget_content,
            style: const TextStyle(
              fontSize: 45
            ),
          )
        ],  
      ),
    );
  }
}