import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoSolutionImageWidget extends StatelessWidget {
  final void Function() addImage;
  const NoSolutionImageWidget({
    super.key,
    required this.addImage
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.no_solution_image_widget_label,
          textAlign: TextAlign.center,
          style: const TextStyle( fontSize: 25 ),
        ),
        TextButton(
          onPressed: addImage,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(
                  AppLocalizations.of(context)!.no_solution_image_widget_add_photo_button,
                  style: const TextStyle(
                    fontSize: 25
                  ),
                )
              ),
              const Icon(
                Icons.add_a_photo,
                size: 30,
              )
            ],
          )
        )
      ],
    );
  }
}