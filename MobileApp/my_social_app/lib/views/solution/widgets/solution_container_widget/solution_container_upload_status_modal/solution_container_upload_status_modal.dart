import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/solutions_state/selectors.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/shared/entity_container_upload_status/entity_container_upload_status.dart';
import 'solution_container_upload_status_modal_constants.dart';

class SolutionContainerUploadStatusModal extends StatelessWidget {
  final int solutionId;
  const SolutionContainerUploadStatusModal({
    super.key,
    required this.solutionId
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,EntityContainer>(
      converter: (store) => selectSolution(store, solutionId),
      builder: (context, container) => AlertDialog(
        title: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: EntityContainerUploadStatus(
                container: container,
                diameter: 60,
                failedIconSize: 25,
                rateTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                if(container.status == EntityStatus.uploadFailed){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  final solution = selectSolution(store, solutionId).entity!;
                  store.dispatch(ReuploadSolutionAction(solution: solution));
                }
              },
              child: Text(
                contents[container.status]![getLanguage(context)]!,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}