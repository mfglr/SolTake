import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/valid_user_name_characters.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/action.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'edit_user_name_page_texts.dart';

class EditUserNamePage extends StatefulWidget {
  final UserState user; 
  const EditUserNamePage({super.key,required this.user});

  @override
  State<EditUserNamePage> createState() => _EditUserNamePageState();
}

class _EditUserNamePageState extends State<EditUserNamePage> {
  final TextEditingController _controller = TextEditingController();
  bool isExist = true;
  bool loading = false;

  void Function()? _generateApprover(){
    return !isExist && 
    _controller.text != widget.user.userName && 
    _controller.text.isNotEmpty ? 
      (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(UpdateUserNameAction(userName: _controller.text));
        Navigator.of(context).pop();
      } :
      null;
  }

  @override
  void initState() {
    _controller.text = widget.user.userName;
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
        actions: [
          TextButton(
            onPressed: _generateApprover(),
            child: loading ? 
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2)
              ) : 
              const Icon(Icons.check)
          )
        ],
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _controller,
          enableSuggestions: false,
          decoration: const InputDecoration(
            border: OutlineInputBorder()
          ),
          onChanged: (value) => setState(() {
            if(value.isNotEmpty && !validUserNameChracters.contains(value[value.length - 1])){
              ToastCreator.displayError(
                invalidCharacters[getLanguage(context)]!,
                length: 2
              );
              _controller.text = value.substring(0,value.length - 1);
              return;
            }
            if(value == "") return;
            loading = true;
            UserService()
              .isUserNameExist(value)
              .then((response) => setState(() {
                isExist = response;
                loading = false;
              }));
          }),
        ),
      ),
    );
  }
}