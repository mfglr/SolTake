import 'package:my_social_app/services/exam_request_service.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/exam_reqiest_status.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/exam_request_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void createExamRequestMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is CreateExamRequestAction){
    ExamRequestService
      .create(action.name, action.initialism)
      .then((id) => store.dispatch(CreateExamRequestSuccessAction(
        examRequest: ExamRequestState(
          id: id.id,
          name: action.name,
          initialism: action.initialism,
          state: ExamReqiestStatus.pending
        )
      )));
  }
  next(action);
}

void nextExamRequestsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextExamRequestsAction){
    ExamRequestService
      .getExamRequests(store.state.examRequests.next)
      .then((examRequests) => store.dispatch(NextExamRequestsSuccessAction(examRequests: examRequests.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const NextExamRequestsFailedAction());
        throw e;
      });
  }
  next(action);
}

void firstExamRequestsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is FirstExamRequestsAction){
    ExamRequestService
      .getExamRequests(store.state.examRequests.next)
      .then((examRequests) => store.dispatch(FirstExamRequestsSuccessAction(examRequests: examRequests.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const FirstExamRequestsFailedAction());
        throw e;
      });
  }
  next(action);
}