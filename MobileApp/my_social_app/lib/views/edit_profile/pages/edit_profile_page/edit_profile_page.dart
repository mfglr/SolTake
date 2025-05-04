import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/edit_profile/modals/update_profile_photo_modal.dart';
import 'package:my_social_app/views/edit_profile/pages/edit_biography_page/edit_biography_page.dart';
import 'package:my_social_app/views/edit_profile/pages/edit_name_page/edit_name_page.dart';
import 'package:my_social_app/views/edit_profile/pages/edit_user_name_page/edit_user_name_page.dart';
import 'package:my_social_app/views/edit_profile/widgets/edit_user_field_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/profile_image_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

import 'edit_profile_page_texts.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context, listen: false);
    final user = store.state.currentUser!;
    _userNameController.text = user.userName;
    _nameController.text = user.name ?? "";
    super.initState();
  }

  void _showUpdateProfilePhotoModal(BuildContext context){
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => const UpdateProfilePhotoModal(),
      isDismissible: true
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState>(
      converter: (store) => store.state.currentUser!,
      builder:(contex,user){
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: LanguageWidget(
              child: (language) => Text(
                title[language]!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ProfileImageWidget(
                                  user: user,
                                  diameter: 100,
                                ),
                                IconButton(
                                  onPressed: () => _showUpdateProfilePhotoModal(contex),
                                  padding: const EdgeInsets.all(30),
                                  icon: const Icon(
                                    Icons.photo_camera,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.formatUserName(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              if(user.name != null)
                                Text(
                                  user.name!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: EditUserFieldWidget(
                          label: AppLocalizations.of(context)!.edit_profile_page_user_name_label,
                          value: compressText(user.userName, 15),
                          onPressed: () =>
                            Navigator
                              .of(context)
                              .push(MaterialPageRoute(builder: (contex) => EditUserNamePage(user: user))),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: EditUserFieldWidget(
                          label: AppLocalizations.of(context)!.edit_profile_page_name_label,
                          value: compressText(user.name ?? "", 15),
                          onPressed: () => 
                            Navigator
                              .of(context)
                              .push(MaterialPageRoute(builder: (context) => EditNamePage(user:user))),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: EditUserFieldWidget(
                          label: AppLocalizations.of(context)!.edit_profile_page_biography_label,
                          value: compressText(user.biography ?? "", 20),
                          onPressed: () =>
                            Navigator
                              .of(context)
                              .push(MaterialPageRoute(builder: (context) => EditBiographyPage(user: user))),
                        ),
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}