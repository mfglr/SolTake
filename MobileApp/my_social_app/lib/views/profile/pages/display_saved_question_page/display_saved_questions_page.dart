import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/actionDispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      body: StoreConnector<AppState,UserState?>(
        onInit: (store) => store.dispatch(LoadUserAction(userId: store.state.accountState!.id)),
        converter: (store) => store.state.currentUser,
        builder: (context,user){
          if(user == null) return const LoadingWidget();
          return StoreConnector<AppState,Iterable<QuestionState>>(
            onInit: (store) => getNextPageIfNoPage(store,user.savedQuestions,NextUserSavedQuestionsAction(userId: user.id)),
            converter: (store) => store.state.selectUserSavedQuestions(user.id),
            builder: (context,questions) => QuestionItemsWidget(
              questions: questions,
              pagination: user.savedQuestions,
              firstDisplayedQuestionId: questionId,
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                getNextPageIfReady(store, user.savedQuestions, NextUserSavedQuestionsAction(userId: user.id));
              }
            ),
          );
        }
      ),
    );
  }
}