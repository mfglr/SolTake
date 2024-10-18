import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/views/question/widgets/question_item/display_question_likes_button.dart';
import 'package:my_social_app/views/question/widgets/question_item/display_solutions_button.dart';
import 'package:my_social_app/views/question/widgets/question_item/display_video_solutions_button.dart';
import 'package:my_social_app/views/question/widgets/question_item/question_item_popup_menu.dart';
import 'package:my_social_app/views/question/widgets/question_item/question_state_widget.dart';
import 'package:my_social_app/views/question/widgets/question_item/save_question_button.dart';
import 'package:my_social_app/views/shared/extendable_content/extendable_content.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/question/widgets/question_item/exam_tag_item.dart';
import 'package:my_social_app/views/question/widgets/question_item/question_comment_button_widget.dart';
import 'package:my_social_app/views/question/widgets/question_item/question_images_slider.dart';
import 'package:my_social_app/views/question/widgets/question_item/question_like_button.dart';
import 'package:my_social_app/views/question/widgets/question_item/subject_tag_item.dart';
import 'package:my_social_app/views/question/widgets/question_item/topic_tag_item.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class QuestionItemWidget extends StatelessWidget {
  final QuestionState question;
  const QuestionItemWidget({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:12,right: 12,top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () =>
                    Navigator
                      .of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => UserPage(
                            userId: question.appUserId,
                            userName: null
                          )
                        )
                      ),
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                    minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: UserImageWidget(
                          userId: question.appUserId,
                          diameter: 45
                        ),
                      ),
                      Text(question.formatUserName(10))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: QuestionStateWidget(question: question),
                    ),
                    Text(
                      timeago.format(question.createdAt,locale: "en_short")
                    ),
                    SaveQuestionButton(question: question),
                    if(question.isOwner)
                      QuestionItemPopupMenu(question: question),
                  ],
                )
              ],
            ),
          ),
          QuestionImagesSlider(
            key: ValueKey(question.id),
            question: question,
          ),
          Padding(
            padding: const EdgeInsets.only(left:12,right: 12,top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    QuestionLikeButton(question: question),
                    if(question.numberOfLikes > 0)
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: DisplayQuestionLikesButton(question: question)
                      ),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: QuestionCommentButtonWidget(question: question)
                    )
                  ],
                ),
                Row(
                  children: [
                    if(question.numberOfVideoSolutions > 0)
                      DisplayVideoSolutionsButton(question: question),
                    DisplaySolutionsButton(question: question)
                  ],
                )
              ],
            ),
          ),
          if(question.content != "")
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExtendableContent(
                content: question.content,
                numberOfExtention: 25,
              ),
            ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Wrap(
              children: [
                StoreConnector<AppState,ExamState>(
                  converter: (store) => store.state.examEntityState.entities[question.examId]!,
                  builder: (context,exam) => ExamTagItem(exam: exam)
                ),
                StoreConnector<AppState,SubjectState>(
                  converter: (store) => store.state.subjectEntityState.entities[question.subjectId]!,
                  builder: (context,subject) => SubjectTagItem(subject: subject,)
                ),
                if(question.topicId != null)
                  StoreConnector<AppState,TopicState>(
                    converter: (store) => store.state.topicEntityState.entities[question.topicId]!,
                    builder: (context,topic) => TopicTagItem(topic: topic),
                  ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}