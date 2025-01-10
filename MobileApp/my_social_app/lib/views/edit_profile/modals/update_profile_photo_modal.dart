import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:take_media_from_gallery/take_media_from_gallery.dart';
import 'package:uuid/uuid.dart';

class UpdateProfilePhotoModal extends StatelessWidget {
  const UpdateProfilePhotoModal({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,AccountState>(
      converter: (store) => store.state.accountState!,
      builder: (store,account) => StoreConnector<AppState,UserState?>(
        onInit: (store) => store.dispatch(LoadUserAction(userId: account.id)),
        converter: (store) => store.state.userEntityState.entities[account.id],
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
                        TextButton(
                          style: ButtonStyle(
                            shape:WidgetStateProperty.all(const CircleBorder()) 
                          ),
                          onPressed: () =>
                            Navigator
                              .of(context)
                              .pushNamed(takeImageRoute)
                              .then((image){
                                if(image != null && context.mounted){
                                  final store = StoreProvider.of<AppState>(context,listen: false);
                                  store.dispatch(UpdateUserImageAction(
                                    id: const Uuid().v4(),
                                    userId: account.id,
                                    image: image as AppFile
                                  ));
                                  Navigator.of(context).pop();
                                }
                              }),
                          child: Column(
                            children: [
                              const Icon(Icons.photo_camera),
                              Text(AppLocalizations.of(context)!.update_profile_photo_modal_camera)
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
                                  store.dispatch(UpdateUserImageAction(
                                    id: const Uuid().v4(),
                                    userId: account.id,
                                    image: image
                                  ));
                                  Navigator.of(context).pop();
                                }
                              });
                          },
                          child: Column(
                            children: [
                              const Icon(Icons.photo),
                              Text(AppLocalizations.of(context)!.update_profile_photo_modal_galeri)
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