import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/question_user_saves_state/actions.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';

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
          title: AppLocalizations.of(context)!.display_saved_question_page_title,
        ),
      ),
      body: StoreConnector<AppState,Pagination>(
        converter: (store) => store.state.questionUserSaves,
        builder: (context, pagination) => StoreConnector<AppState,Iterable<QuestionState>>(
          onInit: (store) => getNextPageIfNoPage(store, store.state.questionUserSaves, const NextQuestionUserSavesAction()),
          converter: (store) => store.state.selectSavedQuestions,
          builder: (context,questions) => QuestionItemsWidget(
            questions: questions,
            pagination: pagination,
            firstDisplayedQuestionId: questionId,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              getNextPageIfReady(store, store.state.questionUserSaves, const NextQuestionUserSavesAction());
            }
          ),
        ),
      ),
    );
  }
}