import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/search_questions_state/actions.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class DisplaySearchQuestionsPage extends StatelessWidget {
  final int? firstDisplayedQuestionId;
  final int? examId;
  final int? subjectId;
  final int? topicId;

  const DisplaySearchQuestionsPage({
    super.key,
    required this.examId,
    required this.subjectId,
    required this.topicId,
    this.firstDisplayedQuestionId,
    
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: Text(
          AppLocalizations.of(context)!.display_search_questions_page_title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: StoreConnector<AppState,Pagination>(
        converter: (store) => store.state.searchQuestions,
        builder: (context, pagination) => StoreConnector<AppState,Iterable<QuestionState>>(
          onInit: (store) => 
            getNextPageIfNoPage(
              store,
              store.state.searchQuestions,
              NextSearchQuestionsAction(
                examId: examId,
                subjectId: subjectId,
                topicId: topicId
              )
            ),
          converter: (store) => store.state.selectSearchQuestions,
          builder: (context,questions) => QuestionItemsWidget(
            firstDisplayedQuestionId: firstDisplayedQuestionId,
            questions: questions,
            pagination: pagination,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              getNextPageIfReady(
                store,
                store.state.searchQuestions,
                NextSearchQuestionsAction(
                  examId: examId,
                  subjectId: subjectId,
                  topicId: topicId
                )
              );
            },
          ),
        ),
      ),
    );
  }
}