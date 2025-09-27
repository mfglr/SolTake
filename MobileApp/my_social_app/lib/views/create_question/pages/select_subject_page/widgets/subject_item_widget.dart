import 'package:flutter/material.dart';
import 'package:my_social_app/state/exams_state/exam_state.dart';
import 'package:my_social_app/state/subjects_state/subject_state.dart';
import 'package:my_social_app/views/create_question/pages/select_topic_page/select_topic_page.dart';

class SubjectItemWidget extends StatelessWidget {
  final ExamState exam;
  final SubjectState subject;
  const SubjectItemWidget({
    super.key,
    required this.exam,
    required this.subject,
  });

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
                .push(MaterialPageRoute(builder: (context) => SelectTopicPage(
                  exam: exam,
                  subject: subject
                )))
                .then((value){
                  if(value == null || !context.mounted) return;
                  Navigator
                    .of(context)
                    .pop((
                      subject: subject,
                      topic: value.topic,
                      content: value.content,
                      medias: value.medias
                    ));
                }),
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              )
            ),
            child: Text(
              textAlign: TextAlign.center,
              subject.name,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}