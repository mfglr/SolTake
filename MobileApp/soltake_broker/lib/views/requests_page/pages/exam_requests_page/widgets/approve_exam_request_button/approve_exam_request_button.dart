import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/actions.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/exam_request_state.dart';

class ApproveExamRequestButton extends StatelessWidget {
  final ExamRequestState examRequest;
  const ApproveExamRequestButton({
    super.key,
    required this.examRequest
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(ApproveExamRequestAction(id: examRequest.id));
      },
      icon: const Icon(
        Icons.check_circle,
        color: Colors.green,
      )
    );
  }
}