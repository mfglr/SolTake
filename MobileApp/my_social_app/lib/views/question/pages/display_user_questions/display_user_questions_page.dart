import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/question/pages/display_user_questions/display_user_quetions_page_constants.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';

class DisplayUserQuestionsPage extends StatelessWidget {
  final UserState user;
  final int? firstDisplayedQuestionId;
  
  const DisplayUserQuestionsPage({
    super.key,
    required this.user,
    this.firstDisplayedQuestionId
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(store, selectUserQuestions(store, user.id), RefreshUserQuestionsAction(userId: user.id));
        return store.onChange.map((state) => state.questions.userQuestions[user.id]!).firstWhere((e) => !e.loadingNext);
      },
      child: Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: Text(
              "${user.userName}${AppLocalizations.of(context)!.display_user_questions_page_title}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          body: StoreConnector<AppState, Pagination<int,QuestionState>>(
            onInit: (store) => getNextPageIfNoPage(
              store,
              selectUserQuestions(store, user.id),
              NextUserQuestionsAction(userId: user.id)
            ),
            converter: (store) => selectUserQuestions(store, user.id),
            builder: (context, pagination) => QuestionItemsWidget(
              firstDisplayedQuestionId: firstDisplayedQuestionId,
              noQuestionContent: noUserQuestions[getLanguage(context)]!,
              pagination: pagination,
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                getNextPageIfReady(store, selectUserQuestions(store, user.id), NextUserQuestionsAction(userId: user.id));
              },
            ),
          ),
        ),
    );
  }
}