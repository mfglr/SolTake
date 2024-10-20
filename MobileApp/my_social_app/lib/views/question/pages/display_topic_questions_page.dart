import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DisplayTopicQuestionsPage extends StatelessWidget {
  final int topicId;
  const DisplayTopicQuestionsPage({super.key, required this.topicId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,TopicState>(
      converter: (store) => store.state.topicEntityState.entities[topicId]!,
      builder: (context,topic) =>  Scaffold(
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
        body: RefreshIndicator(
          onRefresh: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getPrevPageIfReady(store, topic.questions,PrevTopicQuestionsAction(topicId: topicId));
            return store.onChange.firstWhere((state) => !state.topicEntityState.entities[topicId]!.questions.loadingPrev);
          },
          child: StoreConnector<AppState,Iterable<QuestionState>>(
            onInit: (store) => getNextPageIfNoPage(store,topic.questions,NextTopicQuestionsAction(topicId: topicId)),
            converter: (store) => store.state.selectTopicQuestions(topicId),
            builder: (context,questions) => QuestionItemsWidget(
              questions: questions.toList(),
              pagination: topic.questions,
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                getNextPageIfReady(store,topic.questions,NextTopicQuestionsAction(topicId: topicId));
              },
            ),
          ),
        ),
      ),
    );
  }
}