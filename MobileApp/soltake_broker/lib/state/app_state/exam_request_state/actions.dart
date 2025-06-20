import 'package:flutter/foundation.dart';
import 'package:soltake_broker/state/app_state/actions.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/exam_request_state.dart';

@immutable
class ExamRequestAction extends AppAction{
  const ExamRequestAction();
}

@immutable
class NextPendingExamRequestsAction extends ExamRequestAction{
  const NextPendingExamRequestsAction();
}
@immutable
class NextPendingExamRequestsSuccessAction extends ExamRequestAction{
  final Iterable<ExamRequestState> examRequets;
  const NextPendingExamRequestsSuccessAction({required this.examRequets});
}
@immutable
class NextPendingExamRequestsFailedAction extends ExamRequestAction{
  const NextPendingExamRequestsFailedAction();
}

@immutable
class FirstPendingExamRequestsAction extends ExamRequestAction{
  const FirstPendingExamRequestsAction();
}
@immutable
class FirstPendingExamRequestsSuccessAction extends ExamRequestAction{
  final Iterable<ExamRequestState> examRequets;
  const FirstPendingExamRequestsSuccessAction({required this.examRequets});
}
@immutable
class FirstPendingExamRequestsFailedAction extends ExamRequestAction{
  const FirstPendingExamRequestsFailedAction();
}

@immutable
class ApproveExamRequestAction extends ExamRequestAction{
  final int id;
  const ApproveExamRequestAction({required this.id});
}
@immutable
class ApproveExamRequestSuccessAction extends ExamRequestAction{
  final int id;
  const ApproveExamRequestSuccessAction({required this.id});
}

@immutable
class RejectExamRequestAction extends ExamRequestAction{
  final int id;
  final int reason;
  const RejectExamRequestAction({required this.id,required this.reason});
}
@immutable
class RejectExamRequestSuccessAction extends ExamRequestAction{
  final int id;
  const RejectExamRequestSuccessAction({required this.id});
}