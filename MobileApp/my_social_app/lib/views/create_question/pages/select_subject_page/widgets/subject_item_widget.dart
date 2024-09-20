import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/views/create_question/pages/select_topic_page.dart';

class SubjectItemWidget extends StatelessWidget {
  final SubjectState subject;
  const SubjectItemWidget({
    super.key,
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
                .push(MaterialPageRoute(builder: (context) => SelectTopicPage(subjectId: subject.id)))
                .then((value){
                  if(value == null) return;
                  Navigator
                    .of(context)
                    .pop((
                      subjectId: subject.id,
                      topicIds: value.topicIds,
                      content: value.content,
                      images: value.images
                    ));
                })
            ,
            style: ButtonStyle(
              shape: WidgetStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))
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