import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/client_id_generator.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
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
          var user = selectUserById(store, userId).entity!;
          var id = ClientIdGenerator.generate();

          var question = QuestionState.create(
            id: id,
            userId: user.id,
            userName: user.userName,
            content: value.content,
            exam: value.exam,
            subject: value.subject,
            topic: value.topic,
            medias: value.medias,
            image: user.image
          );

          store.dispatch(UploadQuestionAction(question: question));
        }
      });
}