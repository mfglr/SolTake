import 'package:flutter/material.dart';
import 'package:multimedia_grid/multimedia_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/solutions_state/solution_state.dart';

class SolutionAbstractItemWidget extends StatelessWidget {
  final SolutionState solution;
  final void Function(int solutionId) onTap;

  const SolutionAbstractItemWidget({
    super.key,
    required this.solution,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: MultimediaGrid(
        state: solution.isCreatedByAI ? solution.aiImage : solution.medias.firstOrNull,
        blobServiceUrl: AppClient.blobService,
        noMediaPath: noMediaAssetPath,
        notFoundMediaPath: noMediaAssetPath,
        onTap: () => onTap(solution.id),
      )
    );
  }
}