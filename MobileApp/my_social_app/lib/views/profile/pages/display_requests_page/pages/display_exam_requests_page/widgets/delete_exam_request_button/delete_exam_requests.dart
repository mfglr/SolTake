import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/exam_requests_state/actions.dart';
import 'package:my_social_app/state/exam_requests_state/exam_request_state.dart';
import 'package:my_social_app/state/state.dart';

class DeleteExamRequests extends StatelessWidget {
  final ExamRequestState examRequest;
  const DeleteExamRequests({
    super.key,
    required this.examRequest
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(DeleteExamRequestAction(id: examRequest.id));
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      )
    );
  }
}