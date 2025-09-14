import 'package:flutter/material.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/packages/entity_state/entity_container.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_container_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/question/pages/display_question_page/display_question_page_texts.dart';

class QuestionSuccessPage extends StatelessWidget {
  final EntityContainer<int,QuestionState> container;
  
  const QuestionSuccessPage({
    super.key,
    required this.container
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) => AppTitle(
            title: "${container.entity!.userName}${title[language]}"
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: QuestionContainerWidget(
          container: container,
        )
      ),
    );
  }
}