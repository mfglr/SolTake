import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/question_item/question_item_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/question/pages/display_question_page/display_question_page_texts.dart';

class QuestionSuccessPage extends StatelessWidget {
  final QuestionState question;
  
  const QuestionSuccessPage({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) => AppTitle(
            title: "${question.userName}${title[language]}"
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: QuestionItemWidget(
          question: question,
        )
      ),
    );
  }
}