import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/new_questions_state/actions.dart';
import 'package:my_social_app/state/app_state/new_questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/topics_state/topic_state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/views/question/pages/display_topic_questions_page/display_topic_questions_page_constants.dart';
import 'package:my_social_app/views/question/widgets/question_items.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class DisplayTopicQuestionsPage extends StatelessWidget {
  final TopicState topic;
  const DisplayTopicQuestionsPage({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        final paginantion = selectTopicQuestionPagination(store, topic.id);
        if(!paginantion.loadingNext){
          store.dispatch(RefreshTopicQuestionsAction(topicId: topic.id));
        }
        return onTopicQuestionsLoaded(store, topic.id);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: Text(
            "${AppLocalizations.of(context)!.display_topic_questions_page_title}: ${topic.name}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: StoreConnector<AppState,(KeyPagination<int>, Iterable<QuestionState>)>(
          onInit: (store){
            final paginantion = selectTopicQuestionPagination(store, topic.id);
            if(paginantion.noPage){
              store.dispatch(NextTopicQuestionsAction(topicId: topic.id));
            }
          },
          converter: (store) => selectTopicPaginationAndQuestions(store, topic.id),
          builder: (context, data) => QuestionItems(
            data: data,
            noQuestionContent: noTopicQuestions[getLanguage(context)]!,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              final paginantion = selectTopicQuestionPagination(store, topic.id);
              if(paginantion.isReadyForNextPage){
                store.dispatch(NextTopicQuestionsAction(topicId: topic.id));
              }
            },
          ),
        ),
      ),
    );
  }
}