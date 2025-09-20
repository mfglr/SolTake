import 'package:flutter/material.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_container_widget.dart';
import 'package:my_social_app/views/shared/app_column.dart';

class QuestionContinersWidget extends StatefulWidget {
  final Iterable<EntityContainer<int,QuestionState>> containers;
  final int? firstDisplayedQuestionId;

  const QuestionContinersWidget({
    super.key,
    required this.containers,
    this.firstDisplayedQuestionId
  });

  @override
  State<QuestionContinersWidget> createState() => _QuestionContinersWidgetState();
}

class _QuestionContinersWidgetState extends State<QuestionContinersWidget> {
  final _key = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(_key.currentContext != null){
        Scrollable.ensureVisible(_key.currentContext!);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
    AppColumn(
      children: widget.containers.map((container) => QuestionContainerWidget(
        key: widget.firstDisplayedQuestionId == container.key ? _key : ValueKey(container.key),
        container: container
      )),
      margin: const EdgeInsetsGeometry.only(bottom: 16),
    );
}