import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_file_status.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UploadingCircle extends StatelessWidget {
  final UploadingFileStatus status;
  final double rate;
  final void Function() onfailed;

  const UploadingCircle({
    super.key,
    required this.status,
    required this.rate,
    required this.onfailed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(status == UploadingFileStatus.loading)
            if(rate >= 1)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: Text(
                      AppLocalizations.of(context)!.uploading_circle_processing,
                      style: const TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  LoadingAnimationWidget.horizontalRotatingDots(
                    color: Colors.white,
                    size: 12,
                  ),
                ],
              )
            else
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      backgroundColor: Colors.blue,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                      value: rate,
                    ),
                  ),
                  Text(
                    "${(rate * 100).toStringAsFixed(2)}%",
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              )
          else
            if(status == UploadingFileStatus.success)
              const Icon(
                Icons.done,
                color: Colors.green,
                size: 64,
              )
            else
              TextButton(
                onPressed: onfailed,
                child: Column(
                  children: [
                    const Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 64,
                    ),
                    Text(
                      AppLocalizations.of(context)!.uploading_circle_failed_content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ],
                )
              )
        ],
      ),
    );
  }
}