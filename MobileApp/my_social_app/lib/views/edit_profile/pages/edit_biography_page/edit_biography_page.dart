import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/user.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/users_state/action.dart';
import 'package:my_social_app/state/users_state/user_state.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'edit_biographt_page_texts.dart';

class EditBiographyPage extends StatefulWidget {
  final UserState user;
  const EditBiographyPage({
    super.key,
    required this.user
  });

  @override
  State<EditBiographyPage> createState() => _EditBiographyPageState();
}

class _EditBiographyPageState extends State<EditBiographyPage> {
  final TextEditingController _controller = TextEditingController();
  late String _newBiography;
  @override
  void initState() {
    _controller.text = widget.user.biography ?? "";
    _newBiography = widget.user.biography ?? "";
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
        actions: [
          TextButton(
            onPressed: _newBiography != widget.user.biography ? (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(UpdateUserBiographyAction(biography: _newBiography));
              Navigator.of(context).pop();
            } : null,
            child: const Icon(Icons.check)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _controller,
          maxLength: userBiographyMaxLength,
          minLines: 3,
          maxLines: 3,
          autocorrect: false,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText[getLanguage(context)],
          ),
          onChanged: (value) => setState(() { _newBiography = value.trim(); }),
        ),
      )
    );
  }
}