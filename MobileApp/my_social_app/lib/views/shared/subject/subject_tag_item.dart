import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';

class SubjectTagItem extends StatelessWidget {
  final SubjectState subject;

  const SubjectTagItem({super.key,required this.subject});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => Navigator.of(context).pushNamed(displaySubjectQuestionsRoute,arguments: subject),
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