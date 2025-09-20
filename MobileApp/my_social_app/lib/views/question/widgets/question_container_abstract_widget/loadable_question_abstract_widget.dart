import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/load_status.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/loadable_container.dart';
import 'package:my_social_app/custom_packages/media/wigets/medias_grid/media_grid.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/shared/loading_widgets/failed_widget.dart';
import 'package:my_social_app/views/shared/loading_widgets/loading_rectangle_widget.dart';
import 'package:my_social_app/views/shared/loading_widgets/not_found_widget.dart';

class LoadableQuestionAbstractWidget extends StatelessWidget {
  final LoadableContainer<int, QuestionState<int>> container;
  const LoadableQuestionAbstractWidget({
    super.key,
    required this.container
  });

  @override
  Widget build(BuildContext context) {
    return switch(container.status){
      LoadStatus.pending => const LoadingRectangleWidget(),
      LoadStatus.loading => const LoadingRectangleWidget(),
      LoadStatus.success => MediaGrid(
        media: container.entity!.medias.first
      ),
      LoadStatus.failed => const FailedWidget(),
      LoadStatus.notFound => const NotFoundWidget(),
    };
  }
}