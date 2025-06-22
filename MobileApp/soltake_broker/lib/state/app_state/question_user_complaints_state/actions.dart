import 'package:flutter/widgets.dart';
import 'package:soltake_broker/state/app_state/actions.dart';
import 'package:soltake_broker/state/app_state/question_user_complaints_state/question_user_complaint_state.dart';

@immutable
class QuestionUserComplainAction extends AppAction{
  const QuestionUserComplainAction();
}

@immutable
class ViewQuestionUserComplaintsAction extends QuestionUserComplainAction{
  final int id;
  const ViewQuestionUserComplaintsAction({required this.id});
}
@immutable
class ViewQuestionUserComplaintsSuccessAction extends QuestionUserComplainAction{
  final int id;
  const ViewQuestionUserComplaintsSuccessAction({required this.id});
}

@immutable
class NextQuestionUserComplaintsAction extends QuestionUserComplainAction{
  const NextQuestionUserComplaintsAction();
}
@immutable
class NextQuestionUserComplaintsSuccessAction extends QuestionUserComplainAction{
  final Iterable<QuestionUserComplaintState> questionUserComplaints;
  const NextQuestionUserComplaintsSuccessAction({required this.questionUserComplaints});
}
@immutable
class NextQuestionUserComplaintsFailedAction extends QuestionUserComplainAction{
  const NextQuestionUserComplaintsFailedAction();
}

@immutable
class FirstQuestionUserComplaintsAction extends QuestionUserComplainAction{
  const FirstQuestionUserComplaintsAction();
}
@immutable
class FirstQuestionUserComplaintsSuccessAction extends QuestionUserComplainAction{
  final Iterable<QuestionUserComplaintState> questionUserComplaints;
  const FirstQuestionUserComplaintsSuccessAction({required this.questionUserComplaints});
}
@immutable
class FirstQuestionUserComplaintsFailedAction extends QuestionUserComplainAction{
  const FirstQuestionUserComplaintsFailedAction();
}