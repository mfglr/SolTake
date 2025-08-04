import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/new_questions_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/create_question/pages/select_exam_page/select_exam_page.dart';
import 'package:my_social_app/views/display_uploads_page/display_uploads_page.dart';
import 'package:uuid/uuid.dart';

void startCreatingQuestion(BuildContext context){
    Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (context) => const SelectExamPage()))
      .then((value){
        if(value == null) return;
        if(context.mounted){
          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(CreateQuestionAction(
            id: const Uuid().v4(),
            examId: value.examId,
            subjectId: value.subjectId,
            topicId: value.topicId,
            content: value.content,
            medias: value.medias
          ));
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DisplayUploadsPage()));
        }
      });
}