import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/question_image_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/shared/display_image_widget.dart';

class QuestionAbstractItemWidget extends StatelessWidget {
  final QuestionState question;
  final void Function(int questionId)? onTap;
  const QuestionAbstractItemWidget({
    super.key,
    required this.question,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey(question.id),
      padding: const EdgeInsets.all(1.0),
      child: GestureDetector(
        onTap: onTap != null ? (){ onTap!(question.id); } : null,
        child: StoreConnector<AppState,QuestionImageState>(
          onInit: (store) => store.dispatch(LoadQuestionImageAction(id: question.images.first)),
          converter: (store) => store.state.questionImageEntityState.entities[question.images.first]!,
          builder: (context,imageState) => DisplayImageWidget(
            image: imageState.image,
            status: imageState.state,
            boxFit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}