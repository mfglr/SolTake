import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/question/question_items_widget.dart';

class DisplayTopicQuestionsPage extends StatelessWidget {
  final TopicState topic;
  const DisplayTopicQuestionsPage({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: Text(
          "Topic: ${topic.name}",
          style: const TextStyle(fontSize: 16),
        ),
      ),
      body: StoreConnector<AppState,Iterable<QuestionState>>(
        onInit: (store) => store.dispatch(NextPageOfTopicQuestionsIfNoQuestionsAction(topicId: topic.id)),
        converter: (store) => store.state.getTopicQuestions(topic.id),
        builder: (context,questions) => QuestionItemsWidget(
          questions: questions.toList(),
        ),
      ),
    );
  }
}