import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/not_published_questions/actions.dart';
import 'package:my_social_app/state/app_state/not_published_questions/selectors.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/question/pages/display_not_published_questions_page/display_not_published_questions_page_texts.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class DisplayDraftQuestionsPage extends StatelessWidget {
  final int? firstDisplayedQuestionId;
  const DisplayDraftQuestionsPage({
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
        onInit: (store) => getNextPageIfNoPage(store, getNotPublishedQuestions(store), const NextNotPublishedQuestionsAction()),
        converter: (store) => selectNotPublishedQuestions(store),
        builder: (context,questions) => StoreConnector<AppState,Pagination>(
          converter: (store) => getNotPublishedQuestions(store),
          builder:(context,pagination) => QuestionItemsWidget(
            firstDisplayedQuestionId: firstDisplayedQuestionId,
            questions: questions.toList(),
            pagination: pagination,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              getNextPageIfReady(store,getNotPublishedQuestions(store),const NextNotPublishedQuestionsAction());
            },
          ),
        ),
      ),
    );
  }
}