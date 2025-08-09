import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/views/question/pages/display_user_unsolved_questions_page/display_user_unsolved_questions_page_constants.dart';
import 'package:my_social_app/views/question/widgets/question_items.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class DisplayUserUnsolvedQuestionsPage extends StatelessWidget {
  final UserState user;
  final int? firstDisplayedQuestionId;

  const DisplayUserUnsolvedQuestionsPage({
    super.key,
    required this.user,
    this.firstDisplayedQuestionId
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        final paginatin = selectUserUnsolvedQuestionPagination(store, user.id);
        if(!paginatin.loadingNext){
          store.dispatch(RefreshUserUnsolvedQuestionsAction(userId: user.id));
        }
        return onUserUnsolvedQuestionsLoaded(store, user.id);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: Text(
            "${user.userName}${AppLocalizations.of(context)!.display_user_unsolved_questions_page_title}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: StoreConnector<AppState,(KeyPagination<int>, Iterable<QuestionState>)>(
          onInit: (store){
            final paginatin = selectUserUnsolvedQuestionPagination(store, user.id);
            if(paginatin.noPage){
              store.dispatch(NextUserUnsolvedQuestionsAction(userId: user.id));
            }
          },
          converter: (store) => selectUserUnsolvedPaginationAndQuestions(store, user.id),
          builder: (context,data) => QuestionItems(
            firstDisplayedQuestionId: firstDisplayedQuestionId,
            noQuestionContent: noUnsolvedQuestions[getLanguage(context)]!,
            data: data,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              final paginatin = selectUserUnsolvedQuestionPagination(store, user.id);
              if(paginatin.isReadyForNextPage){
                store.dispatch(NextUserUnsolvedQuestionsAction(userId: user.id));
              }
            },
          ),
        ),
      ),
    );
  }
}