import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/views/shared/exam/exam_tag_item.dart';
import 'package:my_social_app/views/shared/question/question_images_slider.dart';
import 'package:my_social_app/views/shared/question/question_like_button.dart';
import 'package:my_social_app/views/shared/subject/subject_tag_item.dart';
import 'package:my_social_app/views/shared/topic/topic_tag_item.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class QuestionItemWidget extends StatelessWidget {
  final QuestionState question;
  const QuestionItemWidget({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed(userPageRoute,arguments: question.appUserId),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: UserImageWidget( userId: question.appUserId, diameter: 45),
                    ),
                    Text(question.formatUserName(10))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: Text(
                  timeago.format(question.createdAt,locale: 'en_short')
                )
              )
            ],
          ),
          QuestionImagesSlider(question: question,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  QuestionLikeButton(question: question),
                  Text(question.numberOfLikes.toString()),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.mode_comment_outlined)
                  ),
                  const Text("56")
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.border_color_outlined)
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: (){},
                child: Text(question.formatContent())
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Wrap(
              children: [
                StoreConnector<AppState,ExamState?>(
                  converter: (store) => store.state.examEntityState.exams[question.examId],
                  builder: (context,exam) => exam != null ? ExamTagItem(exam: exam) : const Text("")
                ),
                StoreConnector<AppState,SubjectState?>(
                  converter: (store) => store.state.subjectEntityState.subjects[question.subjectId],
                  builder: (context,subject) => subject != null ? SubjectTagItem(subject: subject,) : const Text("")
                ),
                ...List.generate(
                  question.topics.length,
                  (index) => StoreConnector<AppState,TopicState?>(
                    converter: (store) => store.state.topicEntityState.topics[question.topics[index]],
                    builder: (context,topic) => topic != null ? TopicTagItem(topic: topic) : const Text(""),
                  )
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}