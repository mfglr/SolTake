import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/client_id_generator.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/topics_state/topic_state.dart';
import 'package:my_social_app/state/users_state/selectors.dart';
import 'package:my_social_app/views/create_question/pages/select_exam_page/select_exam_page.dart';

void startCreatingQuestion(BuildContext context){
    Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (context) => const SelectExamPage()))
      .then((value){
        if(value == null) return;
        if(context.mounted){
          final store = StoreProvider.of<AppState>(context,listen: false);
          
          var userId = store.state.login.login!.id;
          var exam = store.state.exams[value.examId]!;
          var subject = store.state.subjects.examSubjects[value.examId]![value.subjectId]!;
          TopicState? topic;
          if(value.topicId != null){
            topic = store.state.topics.subjectTopics[value.subjectId]![value.topicId];
          }
          var user = selectUserById(store, userId).entity!;
          var id = ClientIdGenerator.generate();

          var question = QuestionState.create(
            id: id,
            userId: user.id,
            userName: user.userName,
            content: value.content,
            exam: exam,
            subject: subject,
            topic: topic,
            medias: value.medias,
            image: user.image
          );

          store.dispatch(UploadQuestionAction(question: question));
        }
      });
}