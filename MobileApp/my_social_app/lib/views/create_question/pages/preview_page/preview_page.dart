import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_container_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_title.dart';
import 'preview_page_constants.dart';

class PreviewPage extends StatelessWidget {
  final EntityContainer<int, QuestionState> container;
  const PreviewPage({
    super.key,
    required this.container
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(
          title: title[getLanguage(context)]!
        ),
      ),
      body: SingleChildScrollView(
        child: QuestionContainerWidget(
          container: container
        ),
      ),
    );
  }
}