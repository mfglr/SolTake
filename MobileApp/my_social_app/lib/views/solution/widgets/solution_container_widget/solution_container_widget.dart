import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/soltution_container_entity_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/solution_container_loading_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/solution_container_not_load_widget/solution_container_not_load_widget.dart';

class SolutionContainerWidget extends StatelessWidget {
  final EntityContainer<int, SolutionState> container;
  const SolutionContainerWidget({
    super.key,
    required this.container
  });

  @override
  Widget build(BuildContext context) {
    return switch(container.status){
      EntityStatus.created => const SolutionContainerLoadingWidget(),
      EntityStatus.loading =>  const SolutionContainerLoadingWidget(),
      EntityStatus.loadSuccess => SoltutionContainerEntityWidget(container: container),
      EntityStatus.loadFailed => SolutionContainerNotLoadWidget(container: container,),
      EntityStatus.notFound => SolutionContainerNotLoadWidget(container: container,),
      EntityStatus.uploading => SoltutionContainerEntityWidget(container: container),
      EntityStatus.processing => SoltutionContainerEntityWidget(container: container),
      EntityStatus.uploadFailed => SoltutionContainerEntityWidget(container: container),
    };
  }
}