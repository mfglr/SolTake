import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/questions_state/question_user_save_state.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:my_social_app/views/profile/pages/display_abstract_saved_questions_page/display_abstract_saved_questions_page_constants.dart';
import 'package:my_social_app/views/profile/pages/display_saved_question_page/display_saved_questions_page.dart';
import 'package:my_social_app/views/question/widgets/question_user_save_abstract_items_widget/question_user_save_abstract_items_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_title.dart';

class DisplayAbstractSavedQuestionsPage extends StatelessWidget {
  const DisplayAbstractSavedQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(title: AppLocalizations.of(context)!.display_abstract_saved_questions_page_title),
      ),
      // body: StoreConnector<AppState, Pagination<int, QuestionUserSaveState>>(
      //   // onInit: (store) => 
      //   //   getNextEntitiesIfNoPage(
      //   //     store,
      //   //     selectQuestionUserSaves(store),
      //   //     const NextQuestionUserSavesAction()
      //   //   ),
      //   converter: (store) => selectQuestionUserSaves(store),
      //   builder: (context, pagination) => QuestionUserSaveAbstractItemsWidget(
      //     pagination: pagination,
      //     noQuestionsContent: noQuestionsContent[getLanguage(context)],
      //     onTap: (questionId) =>
      //       Navigator
      //         .of(context)
      //         .push(MaterialPageRoute(builder: (context) => DisplaySavedQuestionsPage(questionId: questionId))),
      //     onScrollBottom: (){
      //       final store = StoreProvider.of<AppState>(context, listen: false);
      //       // getNextPageIfReady(store, selectQuestionUserSaves(store), const NextQuestionUserSavesAction());
      //     },
      //   ),
      // )
    );
  }
}