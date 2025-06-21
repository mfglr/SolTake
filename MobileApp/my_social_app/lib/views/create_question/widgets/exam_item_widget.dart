import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/views/create_question/pages/select_subject_page/select_subject_page.dart';

class ExamItemWidget extends StatelessWidget {
  final ExamState exam;
  const ExamItemWidget({super.key,required this.exam});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () =>
              Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (context) => SelectSubjectPage(exam: exam)))
                .then((value){
                  if(value == null) return;
                  if(context.mounted){
                    Navigator
                      .of(context)
                      .pop((
                        examId: exam.id,
                        subjectId: value.subjectId,
                        topicId: value.topicId,
                        content: value.content,
                        medias: value.medias
                      ));
                  }
                }),
            child: Column(
              children: [
                Text(
                  exam.initialism,
                  style: const TextStyle(fontSize: 32),
                ),
                Text(
                  exam.name,
                  textAlign: TextAlign.center,
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}