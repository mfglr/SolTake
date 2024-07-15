import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/create_question_state/actions.dart';
import 'package:my_social_app/state/store.dart';

class SubjectItemWidget extends StatelessWidget {
  final String name;
  final int id;
  const SubjectItemWidget({super.key,required this.name,required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: (){
              store.dispatch(UpdateSubjectAction(subjectId: id));
              Navigator.of(context).pushNamed(selectTopicRoute);
            },
            child: Text(
              textAlign: TextAlign.center,
              name,
              style: const TextStyle(fontSize: 16),
            )
          ),
        ],
      ),
    );
  }
}