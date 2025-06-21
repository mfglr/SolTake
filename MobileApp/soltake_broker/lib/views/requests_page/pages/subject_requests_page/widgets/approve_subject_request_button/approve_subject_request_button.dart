import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/subject_request_state/actions.dart';
import 'package:soltake_broker/state/app_state/subject_request_state/subject_request_state.dart';

class ApproveSubjectRequestButton extends StatelessWidget {
  final SubjectRequestState subjectRequest;
  const ApproveSubjectRequestButton({
    super.key,
    required this.subjectRequest
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(ApproveSubjectRequestAction(id: subjectRequest.id));
      },
      icon: Icon(
        Icons.check_circle,
        color: Colors.green,
      )
    );
  }
}