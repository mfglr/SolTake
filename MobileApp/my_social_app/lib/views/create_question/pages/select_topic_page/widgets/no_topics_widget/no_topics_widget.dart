import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/create_question/pages/select_topic_page/widgets/no_topics_widget/no_topics_widget_constants.dart';

class NoTopicsWidget extends StatelessWidget {
  const NoTopicsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(noTopiscFound[getLanguage(context)]!)
      ],
    );
  }
}