import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/views/question/pages/display_topic_questions_page.dart';

class TopicTagItem extends StatelessWidget {
  final TopicState topic;
  const TopicTagItem({super.key,required this.topic});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => 
        Navigator
          .of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => DisplayTopicQuestionsPage(
                topicId: topic.id
              )
            )
          ),
      child:  Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            topic.name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900
            ),
          )          
        ],
      ),
    );
  }
}