import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_user_saves_state/actions.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/profile/pages/display_saved_question_page/display_saved_questions_page.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_items_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DisplayAbstractSavedQuestionsPage extends StatelessWidget {
  const DisplayAbstractSavedQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(title: AppLocalizations.of(context)!.display_abstract_saved_questions_page_title),
      ),
      body: StoreConnector<AppState,Pagination>(
        converter: (store) => store.state.questionUserSaves,
        builder: (context,pagination) => StoreConnector<AppState, Iterable<QuestionState>>(
          onInit: (store) => getNextPageIfNoPage(store, store.state.questionUserSaves, const NextQuestionUserSavesAction()),
          converter: (store) => store.state.selectSavedQuestions,
          builder: (context, questions) => QuestionAbstractItemsWidget(
            questions: questions,
            pagination: pagination,
            onTap: (questionId) =>
              Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (context) => DisplaySavedQuestionsPage(questionId: questionId))),
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context, listen: false);
              getNextPageIfReady(store, store.state.questionUserSaves, const NextQuestionUserSavesAction());
            },
          ),
        ),
      )
    );
  }
}