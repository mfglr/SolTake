import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/uploading_user_image_state/uploading_user_image_state.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_circle.dart';

class UploadingUserImageModal extends StatelessWidget {
  final UploadingUserImageState state;
  
  const UploadingUserImageModal({
    super.key,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close)
            )
          ],
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: const BoxDecoration(
                shape: BoxShape.circle
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.file(
                width: MediaQuery.of(context).size.width * 3 / 4,
                height: MediaQuery.of(context).size.width * 3 / 4,
                File(state.file.path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: UploadingCircle(
                status: state.status,
                rate: state.rate,
                onfailed: (){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  store.dispatch(UpdateUserImageAction(
                    userId: store.state.accountState!.id,
                    file: state.file
                  ));
                }
              )
            )
          ],
        ),
        
      ],
    );
  }
}