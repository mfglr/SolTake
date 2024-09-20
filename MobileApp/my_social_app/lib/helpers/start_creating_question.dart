import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/create_question/pages/select_exam_page/select_exam_page.dart';

void startCreatingQuestion(BuildContext context){
    Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (context) => const SelectExamPage()))
      .then((value){
        if(value == null) return;
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(CreateQuestionAction(
          examId: value.examId,
          subjectId: value.subjectId,
          topicIds: value.topicIds,
          content: value.content,
          images: value.images
        ));
      });
  }