import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

import 'edit_name_page_texts.dart';

class EditNamePage extends StatefulWidget {
  final UserState user;
  const EditNamePage({super.key,required this.user});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  final TextEditingController _controller = TextEditingController();
  late String _newName;
  @override
  void initState() {
    _controller.text = widget.user.name ?? "";
    _newName = widget.user.name ?? "";
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
            onPressed: _newName != widget.user.name ? (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(UpdateNameAction(name: _controller.text));
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
          autocorrect: false,
          decoration: const InputDecoration(
            border: OutlineInputBorder()
          ),
          onChanged: (value){
            setState(() {
              _newName = value.trim();
            });
          },
        ),
      )
    );
  }
}