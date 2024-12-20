import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/views/question/pages/display_subject_questions_page.dart';

class SubjectTagItem extends StatelessWidget {
  final SubjectState subject;

  const SubjectTagItem({super.key,required this.subject});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DisplaySubjectQuestionsPage(subjectId: subject.id,))),
      child:  Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            subject.name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900
            ),
          )          
        ],
      ),
    );
  }
}