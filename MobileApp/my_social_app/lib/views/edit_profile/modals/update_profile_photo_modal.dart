import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/edit_profile/modals/update_profile_photot_modal_texts.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:take_media/pages/take_image_page.dart';
import 'package:take_media_from_gallery/take_media_from_gallery.dart';

class UpdateProfilePhotoModal extends StatelessWidget {
  const UpdateProfilePhotoModal({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,LoginState>(
      converter: (store) => store.state.loginState!,
      builder: (store,login) => StoreConnector<AppState,UserState?>(
        onInit: (store) => store.dispatch(LoadUserAction(userId: login.id)),
        converter: (store) => store.state.userEntityState.getValue(login.id),
        builder: (store,user){
          if(user == null) return const LoadingView();
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
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                shape:WidgetStateProperty.all(const CircleBorder()) 
                              ),
                              onPressed: () =>
                                Navigator
                                  .of(context)
                                  .push(MaterialPageRoute(builder: (context) => const TakeImagePage()))
                                  .then((image){
                                    if(image != null && context.mounted){
                                      final store = StoreProvider.of<AppState>(context,listen: false);
                                      store.dispatch(UploadUserImageAction(
                                        userId: login.id,
                                        image: image as AppFile
                                      ));
                                      Navigator.of(context).pop();
                                    }
                                  }),
                              child: Column(
                                children: [
                                  const Icon(Icons.photo_camera),
                                  LanguageWidget(
                                    child: (language) => Text(
                                      camera[language]!
                                    ),
                                  )
                                ],
                              ),
                              ),
                            TextButton(
                              style: ButtonStyle(
                                shape:WidgetStateProperty.all(const CircleBorder()) 
                              ),
                              onPressed: (){
                                TakeMediaFromGalleryService()
                                  .getImage()
                                  .then((image){
                                    if(image != null && context.mounted){
                                      final store = StoreProvider.of<AppState>(context,listen: false);
                                      store.dispatch(UploadUserImageAction(
                                        userId: login.id,
                                        image: image
                                      ));
                                      Navigator.of(context).pop();
                                    }
                                  });
                              },
                              child: Column(
                                children: [
                                  const Icon(Icons.photo),
                                  LanguageWidget(
                                    child: (language) => Text(
                                      gallery[language]!
                                    ),
                                  )
                                ],
                              )
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: 
                            user.image != null ? (){
                              final store = StoreProvider.of<AppState>(context,listen: false);
                              store.dispatch(RemoveUserImageAction(userId: user.id));
                              Navigator.of(context).pop();
                            } : null,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.close,
                                size: 40,
                                color: user.image != null ?Colors.red : Colors.red[100],
                              ),
                              LanguageWidget(
                                child: (language) => Text(
                                  remove[language]!,
                                  style: TextStyle(
                                    color: user.image != null ?Colors.red : Colors.red[100],
                                  ),
                                ),
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}