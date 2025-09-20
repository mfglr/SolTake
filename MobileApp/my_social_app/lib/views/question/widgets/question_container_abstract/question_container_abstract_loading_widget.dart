import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/loading_widgets/loading_rectangle_widget.dart';

class QuestionContainerAbstractLoadingWidget extends StatelessWidget {
  const QuestionContainerAbstractLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingRectangleWidget();
  }
}