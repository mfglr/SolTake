import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/exam_request_state.dart';

@immutable
class ExamRequestsAction extends AppAction{
  const ExamRequestsAction(); 
}

@immutable
class CreateExamRequestAction extends ExamRequestsAction{
  final String name;
  final String initialism;
  const CreateExamRequestAction({required this.name,required this.initialism});
}
@immutable
class CreateExamRequestSuccessAction extends ExamRequestsAction{
  final ExamRequestState examRequest;
  const CreateExamRequestSuccessAction({required this.examRequest});
}

@immutable
class DeleteExamRequestAction extends ExamRequestsAction{
  final int id;
  const DeleteExamRequestAction({required this.id});
}
@immutable
class DeleteExamRequestSuccessAction extends ExamRequestsAction{
  final int id;
  const DeleteExamRequestSuccessAction({required this.id});
}

@immutable
class NextExamRequestsAction extends ExamRequestsAction{
  const NextExamRequestsAction();
}
@immutable
class NextExamRequestsSuccessAction extends ExamRequestsAction{
  final Iterable<ExamRequestState> examRequests;
  const NextExamRequestsSuccessAction({required this.examRequests});
}
@immutable
class NextExamRequestsFailedAction extends ExamRequestsAction{
  const NextExamRequestsFailedAction();
}

@immutable
class FirstExamRequestsAction extends ExamRequestsAction{
  const FirstExamRequestsAction();
}
@immutable
class FirstExamRequestsSuccessAction extends ExamRequestsAction{
  final Iterable<ExamRequestState> examRequests;
  const FirstExamRequestsSuccessAction({required this.examRequests});
}
@immutable
class FirstExamRequestsFailedAction extends ExamRequestsAction{
  const FirstExamRequestsFailedAction();
}