import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/new_questions_state/actions.dart';
import 'package:my_social_app/state/app_state/new_questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/views/question/pages/display_search_questions_page/display_search_questions_page_constant.dart';
import 'package:my_social_app/views/question/widgets/question_items.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class DisplaySearchQuestionsPage extends StatelessWidget {
  final int? firstDisplayedQuestionId;

  const DisplaySearchQuestionsPage({
    super.key,
    this.firstDisplayedQuestionId,
    
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        final pagination = selectSearchPageQuestionPagination(store);
        if(!pagination.loadingNext){
          store.dispatch(const RefreshSearchPageQuestionsAction());
        }
        return onSearchPageQuestionsLoaded(store);
      },
      child: Scaffold(
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
        body: StoreConnector<AppState,(KeyPagination<int>, Iterable<QuestionState>)>(
          onInit: (store){
            final pagination = selectSearchPageQuestionPagination(store);
            if(pagination.noPage){
              store.dispatch(const NextSearchPageQuestionsAction());
            }
          },
          converter: (store) => selectSearchPagePaginationAndQuestions(store),
          builder: (context, data) => QuestionItems(
            firstDisplayedQuestionId: firstDisplayedQuestionId,
            data: data,
            noQuestionContent: questionNotFound[getLanguage(context)]!,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              final pagination = selectSearchPageQuestionPagination(store);
              if(pagination.isReadyForNextPage){
                store.dispatch(const NextSearchPageQuestionsAction());
              }
            },
          ),
        ),
      ),
    );
  }
}