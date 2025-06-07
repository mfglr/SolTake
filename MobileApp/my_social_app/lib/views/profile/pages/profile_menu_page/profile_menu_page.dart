import 'package:flutter/material.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/profile_menu_page_texts.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/change_language_menu_item/change_language_menu_item.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/delete_user_menu_item/delete_user_menu_item.dart';
// import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/diplay_balance_menu_item/display_balance_menu_item.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/display_blocks_menu_item/display_blocks_menu_item.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/display_saved_question_menu_item/display_saved_questions_menu_item.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/display_saved_solutions/display_saved_solutions_menu_item.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/logout_menu_item/logout_menu_item.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class ProfileMenuPage extends StatelessWidget {
  const ProfileMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) => AppTitle(
            title: title[language]!
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            DisplaySavedQuestionsMenuItem(),
            DisplaySavedSolutionsMenuItem(),
            ChangeLanguageMenuItem(),
            // DisplayBalanceMenuItem(),
            DisplayBlocksMenuItem(),
            LogoutMenuItem(),
            DeleteUserMenuItem()
          ],
        ),
      ),
    );
  }
}