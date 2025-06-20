import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/actions.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/exam_request_state.dart';

class RejectExamRequestButton extends StatelessWidget {
  final ExamRequestState examRequest;
  const RejectExamRequestButton({
    super.key,
    required this.examRequest
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(RejectExamRequestAction(id: examRequest.id));
      },
      icon: const Icon(
        Icons.close,
        color: Colors.red,
      )
    );
  }
}