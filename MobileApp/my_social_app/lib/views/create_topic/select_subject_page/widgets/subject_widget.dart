import 'package:flutter/material.dart';
import 'package:my_social_app/state/subjects_state/subject_state.dart';
import 'package:my_social_app/views/create_topic/create_topic_page/create_topic_page.dart';

class SubjectWidget extends StatelessWidget {
  final SubjectState subject;
  const SubjectWidget({
    super.key,
    required this.subject
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextButton(
          onPressed: () =>
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => const CreateTopicPage()))
              .then((value){
                if(value != null && context.mounted){
                  Navigator.of(context).pop((subject: subject, name: value));
                }
              }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                subject.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}