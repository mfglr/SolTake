import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/create_question_state/actions.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';

class SubjectItemWidget extends StatelessWidget {
  final SubjectState subject;
  const SubjectItemWidget({super.key,required this.subject});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: (){
              store.dispatch(UpdateSubjectAction(subjectId: subject.id));
              Navigator.of(context).pushNamed(selectTopicRoute);
            },
            child: Text(
              textAlign: TextAlign.center,
              subject.name,
              style: const TextStyle(fontSize: 16),
            )
          ),
        ],
      ),
    );
  }
}