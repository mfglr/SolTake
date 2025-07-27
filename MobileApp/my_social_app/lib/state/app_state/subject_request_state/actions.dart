import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/exams_state/exam_state.dart';
import 'package:my_social_app/state/app_state/subject_request_state/subject_request_state.dart';

@immutable
class SubjectRequestAction extends AppAction{
  const SubjectRequestAction();
}

@immutable
class CreateSubjectRequestAction extends SubjectRequestAction{
  final ExamState exam;
  final String name;
  const CreateSubjectRequestAction({required this.exam, required this.name});
}
@immutable
class CreateSubjectRequestSuccessAction extends SubjectRequestAction{
  final SubjectRequestState subjectRequest;
  const CreateSubjectRequestSuccessAction({required this.subjectRequest});
}

@immutable
class NextSubjectRequestsAction extends SubjectRequestAction{
  const NextSubjectRequestsAction();
}
@immutable
class NextSubjectRequestsSuccessAction extends SubjectRequestAction{
  final Iterable<SubjectRequestState> subjectRequests;
  const NextSubjectRequestsSuccessAction({required this.subjectRequests});
}
@immutable
class NextSubjectRequestsFailedAction extends SubjectRequestAction{
  const NextSubjectRequestsFailedAction();
}

@immutable
class FirstSubjectRequestsAction extends SubjectRequestAction{
  const FirstSubjectRequestsAction();
}
@immutable
class FirstSubjectRequestsSuccessAction extends SubjectRequestAction{
  final Iterable<SubjectRequestState> subjectRequests;
  const FirstSubjectRequestsSuccessAction({required this.subjectRequests});
}
@immutable
class FirstSubjectRequestsFailedAction extends SubjectRequestAction{
  const FirstSubjectRequestsFailedAction();
}


@immutable
class DeleteSubjectRequestAction extends SubjectRequestAction{
  final int id;
  const DeleteSubjectRequestAction({required this.id});
}
@immutable
class DeleteSubjectRequestSuccessAction extends SubjectRequestAction{
  final int id;
  const DeleteSubjectRequestSuccessAction({required this.id});
}