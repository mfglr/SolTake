import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/edit_profile/modals/update_profile_photo_modal.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  void showUpdateProfilePhotoModal(BuildContext context){
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => const UpdateProfilePhotoModal(),
      isDismissible: true
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,AccountState>(
      converter: (store) => store.state.accountState!,
      builder: (context,account) => StoreConnector<AppState,UserState?>(
        onInit: (store) => store.dispatch(LoadUserAction(userId: account.id)),
        converter: (store) => store.state.userEntityState.entities[account.id],
        builder:(contex,user){
          if(user == null) return const LoadingView();
          return Scaffold(
            appBar: AppBar(
              leading: const AppBackButtonWidget(),
              title: const Text(
                "Edit your profile",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              UserImageWidget(
                                userId: user.id,
                                diameter: 100,
                              ),
                              IconButton(
                                onPressed: () => showUpdateProfilePhotoModal(contex),
                                padding: const EdgeInsets.all(30),
                                icon: const Icon(
                                  Icons.photo_camera,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      )
    );
  }
}