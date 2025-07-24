import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';

class DisplayTopicQuestionsPage extends StatelessWidget {
  final TopicState topic;
  const DisplayTopicQuestionsPage({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(
          store,
          selectTopicQuestions(store, topic.id),
          RefreshTopicQuestionsAction(topicId: topic.id)
        );
        return store.onChange
          .firstWhere((state) => !state.questions.topicQuestions[topic.id]!.loadingNext);
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
        body: StoreConnector<AppState,Pagination<int,QuestionState>>(
          onInit: (store) => 
            getNextPageIfNoPage(
              store,
              selectTopicQuestions(store, topic.id),
              NextTopicQuestionsAction(topicId: topic.id)
            ),
          converter: (store) => selectTopicQuestions(store, topic.id),
          builder: (context, pagination) => QuestionItemsWidget(
            pagination: pagination,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              getNextPageIfReady(
                store,
                selectTopicQuestions(store, topic.id),
                NextTopicQuestionsAction(topicId: topic.id)
              );
            },
          ),
        ),
      ),
    );
  }
}