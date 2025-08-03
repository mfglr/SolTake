import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/question/widgets/question_user_save_items_widget/question_user_save_items_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'display_saved_questions_page_constants.dart';

class DisplaySavedQuestionsPage extends StatelessWidget {
  final int questionId;
  const DisplaySavedQuestionsPage({
    super.key,
    required this.questionId
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(
          title: title[getLanguage(context)]!,
        ),
      ),
      body: StoreConnector<AppState,Pagination<int, QuestionUserSaveState>>(
        onInit: (store) => getNextEntitiesIfNoPage(store, selectQuestionUserSaves(store), const NextQuestionUserSavesAction()),
        converter: (store) => selectQuestionUserSaves(store),
        builder: (context, pagination) => QuestionUserSaveItemsWidget(
          pagination: pagination,
          noQuestionsContent: noQuestionsContent[getLanguage(context)],
          firstDisplayedQuestionId: questionId,
          onScrollBottom: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(store, selectQuestionUserSaves(store), const NextQuestionUserSavesAction());
          }
        ),
      )
    );
  }
}