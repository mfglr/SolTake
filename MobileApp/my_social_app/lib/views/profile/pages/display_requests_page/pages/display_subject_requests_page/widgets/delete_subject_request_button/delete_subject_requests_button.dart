import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_request_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_request_state/subject_request_state.dart';

class DeleteSubjectRequestsButton extends StatelessWidget {
  final SubjectRequestState subjectRequest;
  const DeleteSubjectRequestsButton({
    super.key,
    required this.subjectRequest
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(DeleteSubjectRequestAction(id: subjectRequest.id));
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      )
    );
  }
}