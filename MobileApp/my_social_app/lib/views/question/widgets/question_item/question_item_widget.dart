import 'package:flutter/material.dart';
import 'package:multimedia_slider/multimedia_slider.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_publishing_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/display_question_likes_button.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/display_solutions_button.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/display_video_solutions_button.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/question_item_popup_menu/question_item_popup_menu.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/question_publishing_state/question_publishing_state_widget.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/question_state_widget.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/save_question_button.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';
import 'package:my_social_app/views/shared/extendable_content/extendable_content.dart';
import 'package:my_social_app/views/user/pages/user_page/user_page.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/exam_tag_item.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/question_comment_button_widget.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/question_like_button.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/subject_tag_item.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/topic_tag_item.dart';

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
                            userId: question.userId,
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
                        child: AppAvatar(
                          key: ValueKey(question.userId),
                          avatar: question,
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
                      child: AppDateWidget(dateTime: question.createdAt)
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: QuestionStateWidget(question: question),
                    ),
                    SaveQuestionButton(question: question),
                    QuestionItemPopupMenu(question: question),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 3 / 5
            ),
            child: MultimediaSlider(
              key: ValueKey(question.id),
              medias: question.medias,
              blobServiceUrl: AppClient.blobService,
              notFoundMediaPath: noMediaAssetPath,
              noMediaPath: noMediaAssetPath,
            ),
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
          if(question.publishingState != QuestionPublishingState.published)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: QuestionPublishingStateWidget(question: question),
            ),
          if(question.content != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExtendableContent(
                content: question.content!,
                numberOfExtention: 25,
              ),
            ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Wrap(
              children: [
                ExamTagItem(exam: question.exam),
                SubjectTagItem(subject: question.subject),
                if(question.topic != null)
                  TopicTagItem(topic: question.topic!)
              ]
            ),
          ),
        ],
      ),
    );
  }
}