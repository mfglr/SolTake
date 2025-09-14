import 'package:flutter/material.dart';
import 'package:my_social_app/state/subjects_state/subject_state.dart';
import 'package:my_social_app/views/question/pages/display_subject_questions_page/display_subject_questions_page.dart';

class SubjectTagItem extends StatelessWidget {
  final SubjectState subject;

  const SubjectTagItem({super.key,required this.subject});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => 
        Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => DisplaySubjectQuestionsPage(subject: subject))),
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