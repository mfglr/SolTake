import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/rejected_questions_state/actions.dart';
import 'package:my_social_app/state/app_state/rejected_questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

import 'display_rejected_questions_page_texts.dart';

class DisplayRejectedQuestionsPage extends StatelessWidget {
  final int? firstDisplayedQuestionId;
  const DisplayRejectedQuestionsPage({
    super.key,
    this.firstDisplayedQuestionId
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) =>  AppTitle(
            title: title[language]!
          )
        )
      ),
      body: StoreConnector<AppState,Iterable<QuestionState>>(
        onInit: (store) => getNextPageIfNoPage(store, store.state.rejectedQuestions, const NextRejectedQuestionsAction()),
        converter: (store) => selectRejectedQuestions(store),
        builder: (context,questions) => StoreConnector<AppState,Pagination>(
          converter: (store) => store.state.rejectedQuestions,
          builder:(context,pagination) => QuestionItemsWidget(
            firstDisplayedQuestionId: firstDisplayedQuestionId,
            questions: questions.toList(),
            pagination: pagination,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              getNextPageIfReady(store,store.state.rejectedQuestions,const NextRejectedQuestionsAction());
            },
          ),
        ),
      ),
    );
  }
}