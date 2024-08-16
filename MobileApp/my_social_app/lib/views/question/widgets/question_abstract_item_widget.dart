import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/display_image_widget.dart';

class QuestionAbstractItemWidget extends StatefulWidget {
  final QuestionState question;
  final void Function(int questionId)? onTap;
  
  const QuestionAbstractItemWidget({
    super.key,
    required this.question,
    this.onTap
  });

  @override
  State<QuestionAbstractItemWidget> createState() => _QuestionAbstractItemWidgetState();
}

class _QuestionAbstractItemWidgetState extends State<QuestionAbstractItemWidget> {
  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(LoadQuestionImageAction(questionId: widget.question.id, index: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey(widget.question.id),
      padding: const EdgeInsets.all(1.0),
      child: GestureDetector(
        onTap: widget.onTap != null ? (){ widget.onTap!(widget.question.id); } : null,
        child: DisplayImageWidget(
          image: widget.question.images.first.image,
          status: widget.question.images.first.state,
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }
}