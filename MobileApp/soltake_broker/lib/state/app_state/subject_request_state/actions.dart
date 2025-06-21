import 'package:flutter/material.dart';
import 'package:soltake_broker/state/app_state/actions.dart';
import 'package:soltake_broker/state/app_state/subject_request_state/subject_request_state.dart';

@immutable
class SubjectRequestAction extends AppAction{
  const SubjectRequestAction();
}

@immutable
class NextPendingSubjectRequestsAction extends SubjectRequestAction{
  const NextPendingSubjectRequestsAction();
}
@immutable
class NextPendingSubjectRequestsSuccessAction extends SubjectRequestAction{
  final Iterable<SubjectRequestState> subjectRequests;
  const NextPendingSubjectRequestsSuccessAction({required this.subjectRequests});
}
@immutable
class NextPendingSubjectRequestsFailedAction extends SubjectRequestAction{
  const NextPendingSubjectRequestsFailedAction();
}

@immutable
class FirstPendingSubjectRequestsAction extends SubjectRequestAction{
  const FirstPendingSubjectRequestsAction();
}
@immutable
class FirstPendingSubjectRequestsSuccessAction extends SubjectRequestAction{
  final Iterable<SubjectRequestState> subjectRequests;
  const FirstPendingSubjectRequestsSuccessAction({required this.subjectRequests});
}
@immutable
class FirstPendingSubjectRequestsFailedAction extends SubjectRequestAction{
  const FirstPendingSubjectRequestsFailedAction();
}


@immutable
class ApproveSubjectRequestAction extends SubjectRequestAction{
  final int id;
  const ApproveSubjectRequestAction({required this.id});
}
@immutable
class ApproveSubjectRequestSuccessAction extends SubjectRequestAction{
  final int id;
  const ApproveSubjectRequestSuccessAction({required this.id});
}

@immutable
class RejectSubjectRequestAction extends SubjectRequestAction{
  final int id;
  final int reason;
  const RejectSubjectRequestAction({required this.id,required this.reason});
}
@immutable
class RejectSubjectRequestSuccessAction extends SubjectRequestAction{
  final int id;
  const RejectSubjectRequestSuccessAction({
    required this.id,
  });
}