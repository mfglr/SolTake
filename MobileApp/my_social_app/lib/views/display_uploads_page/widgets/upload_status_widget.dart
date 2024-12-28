import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';

class UploadStatusWidget extends StatelessWidget {
  final UploadState state;
  const UploadStatusWidget({
    super.key,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
    if(state.status == UploadStatus.loading && state.rate < 1){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 4),
            child: const Text("Yükleniyor")
          ),
          const CircularProgressIndicator(),
        ],
      );
    }
    if(state.status == UploadStatus.loading && state.rate >= 1){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Text("İşleniyor")
          ),
          const CircularProgressIndicator(),
        ],
      );
    }
    if(state.status == UploadStatus.success){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Text("Yükleme başarılı")
          ),
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        ],
      );
    }
    return TextButton(
      onPressed: (){},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Text("Başarısız yükleme")
          ),
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}