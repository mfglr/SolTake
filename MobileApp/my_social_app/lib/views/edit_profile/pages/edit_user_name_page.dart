import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_social_app/constants/valid_user_name_characters.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        title: Text(
          AppLocalizations.of(context)!.edit_user_name_page_title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
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
                AppLocalizations.of(context)!.edit_user_name_page_invalid_characters,
                length: Toast.LENGTH_SHORT
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