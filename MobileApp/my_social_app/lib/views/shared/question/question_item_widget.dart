import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/create_comment_state/actions.dart';
import 'package:my_social_app/state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/views/pages/solution/display_question_solutions_page.dart';
import 'package:my_social_app/views/pages/user/user_page.dart';
import 'package:my_social_app/views/shared/exam/exam_tag_item.dart';
import 'package:my_social_app/views/shared/comment/comment_field_widget.dart';
import 'package:my_social_app/views/shared/question/question_images_slider.dart';
import 'package:my_social_app/views/shared/question/question_like_button.dart';
import 'package:my_social_app/views/shared/comment/comment_items_widget.dart';
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
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: question.appUserId))),
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
                    onPressed: (){
                      store.dispatch(
                        ChangeQuestionAction(
                          question: question
                        )
                      );
                      store.dispatch(
                        const ChangeContentAction(content: "")
                      );
                      store.dispatch(
                        ChangeHintTextAction(
                          hintText: "Comment to ${question.formatUserName(10)}'s question..."
                        ),
                      );

                      showModalBottomSheet<void>(
                        context: context,
                        builder: (context) => Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    icon: const Icon(Icons.close)
                                  )
                                ],
                              ),
                              Expanded(
                                child: StoreConnector<AppState,Iterable<CommentState>>(
                                  onInit:(store) => store.dispatch(NextPageQuestionCommentsIfNoQuestionComments(questionId:  question.id)),
                                  converter: (store) => store.state.getQuestionComments(question.id),
                                  builder: (context,comments) => SingleChildScrollView(
                                    child: CommentItemsWidget(comments: comments)
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: StoreConnector<AppState,CreateCommentState>(
                                  converter: (store) => store.state.createCommentState,
                                  builder: (context,state) => CommentFieldWidget(state: state,)
                                ),
                              ),
                            ],
                          ),
                        ),
                        isDismissible: true
                      );
                    },
                    icon: const Icon(Icons.mode_comment_outlined)
                  ),
                  Text(question.numberOfComments.toString())
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DisplayQuestionSolutionsPage(question: question,)));
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: Text(question.numberOfSolutions.toString())
                        ),
                        const Icon(Icons.border_color_outlined),
                      ],
                    )
                  ),
                ],
              ),
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
                StoreConnector<AppState,ExamState>(
                  converter: (store) => store.state.examEntityState.entities[question.examId]!,
                  builder: (context,exam) => ExamTagItem(exam: exam)
                ),
                StoreConnector<AppState,SubjectState>(
                  converter: (store) => store.state.subjectEntityState.entities[question.subjectId]!,
                  builder: (context,subject) => SubjectTagItem(subject: subject,)
                ),
                ...List.generate(
                  question.topics.length,
                  (index) => StoreConnector<AppState,TopicState>(
                    converter: (store) => store.state.topicEntityState.entities[question.topics.elementAt(index)]!,
                    builder: (context,topic) => TopicTagItem(topic: topic),
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