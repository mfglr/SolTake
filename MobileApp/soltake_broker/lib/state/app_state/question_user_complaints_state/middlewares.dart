import 'package:redux/redux.dart';
import 'package:soltake_broker/services/question_user_complaint_service.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/question_user_complaints_state/actions.dart';

void nextQuestionUserComplaintsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextQuestionUserComplaintsAction){
    QuestionUserComplaintService
      .getUnviewedQuestionUserComplaints(store.state.questionUserComplaints.next)
      .then((e) => store.dispatch(NextQuestionUserComplaintsSuccessAction(questionUserComplaints: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const NextQuestionUserComplaintsFailedAction());
        throw e;
      });
  }
  next(action);
}

void firstQuestionUserComplaintsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is FirstQuestionUserComplaintsAction){
    QuestionUserComplaintService
      .getUnviewedQuestionUserComplaints(store.state.questionUserComplaints.first)
      .then((e) => store.dispatch(FirstQuestionUserComplaintsSuccessAction(questionUserComplaints: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const FirstQuestionUserComplaintsFailedAction());
        throw e;
      });
  }
  next(action);
}