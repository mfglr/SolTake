import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:my_social_app/views/shared/take_multimedya_speed_dial/take_multimedya_speed_dial.dart';

class NoSolutionImageWidget extends StatelessWidget {
  final void Function() takeImage;
  final void Function() takeImages;

  const NoSolutionImageWidget({
    super.key,
    required this.takeImage,
    required this.takeImages
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
        TakeMultimedyaSpeedDial(
          takeImages: takeImages,
          takeVideo: null,
          takeImage: takeImage,
          direction: SpeedDialDirection.down
        )

        // TextButton(
        //   onPressed: takeImage,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Container(
        //         margin: const EdgeInsets.only(right: 5),
        //         child: Text(
        //           AppLocalizations.of(context)!.no_solution_image_widget_add_photo_button,
        //           style: const TextStyle(
        //             fontSize: 25
        //           ),
        //         )
        //       ),
        //       const Icon(
        //         Icons.add_a_photo,
        //         size: 30,
        //       )
        //     ],
        //   )
        // )
      ],
    );
  }
}