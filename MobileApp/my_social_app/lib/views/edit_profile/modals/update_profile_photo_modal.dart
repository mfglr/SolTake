import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/views/shared/loading_view.dart';

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                shape:WidgetStateProperty.all(const CircleBorder()) 
                              ),
                              onPressed: () async {
                                final dynamic image = await Navigator.of(context).pushNamed(takeImageRoute);
                                if(image != null && context.mounted){
                                  final store = StoreProvider.of<AppState>(context,listen: false);
                                  store.dispatch(UpdateCurrentUserImageAction(file: image));
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Column(
                                children: [
                                  Icon(Icons.photo_camera),
                                  Text("Camera")
                                ],
                              ),
                              
                            ),
                            TextButton(
                              style: ButtonStyle(
                                shape:WidgetStateProperty.all(const CircleBorder()) 
                              ),
                              onPressed: (){
                                ImagePicker()
                                  .pickImage(source: ImageSource.gallery)
                                  .then((image){
                                    if(image != null){
                                      final store = StoreProvider.of<AppState>(context,listen: false);
                                      store.dispatch(UpdateCurrentUserImageAction(file: image));
                                      Navigator.of(context).pop();
                                    }
                                  });
                              },
                              child: const Column(
                                children: [
                                  Icon(Icons.photo),
                                  Text("Galeri")
                                ],
                              )
                            )
                            
                          ],
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: 
                        user.hasImage ? (){
                          final store = StoreProvider.of<AppState>(context,listen: false);
                          store.dispatch(const RemoveCurrentUserImageAction());
                          Navigator.of(context).pop();
                        } : null,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.close,
                            size: 40,
                            color: user.hasImage ?Colors.red : Colors.red[100],
                          ),
                          Text(
                            "Remove",
                            style: TextStyle(
                              color: user.hasImage ?Colors.red : Colors.red[100],
                            ),
                          )
                        ],
                      )
                    )
                   
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