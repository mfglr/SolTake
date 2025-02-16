import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/models/languages.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/profile/pages/change_language_page/widgets/language_item.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';

const contents = [ "Türkçe 🇹🇷", "English 🇺🇸" ];
const languages = [ Languages.tr, Languages.en ];

class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,LoginState>(
      converter: (store) => store.state.loginState!,
      builder:(context,account) => Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: const AppTitle(
            title: "",
          ),
        ),
        body: ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context,index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: LanguageItem(
              language: languages.elementAt(index),
              content: contents.elementAt(index),
              isSelected: account.language == languages.elementAt(index)
            ),
          ),
        ),
      ),
    );
  }
}