import 'package:my_social_app/services/exam_request_service.dart';
import 'package:my_social_app/state/exam_requests_state/actions.dart';
import 'package:my_social_app/state/exam_requests_state/exam_request_state.dart';
import 'package:my_social_app/state/exam_requests_state/exam_request_status.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void createExamRequestMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is CreateExamRequestAction){
    ExamRequestService
      .create(action.name, action.initialism)
      .then((id) => store.dispatch(CreateExamRequestSuccessAction(
        examRequest: ExamRequestState(id.id,DateTime.now(),action.name,action.initialism,ExamRequestStatus.pending,null)
      )));
  }
  next(action);
}

void deleteExamRequestMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is DeleteExamRequestAction){
    ExamRequestService
      .delete(action.id)
      .then((_) => store.dispatch(DeleteExamRequestSuccessAction(id: action.id)));
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
      .getExamRequests(store.state.examRequests.first)
      .then((examRequests) => store.dispatch(FirstExamRequestsSuccessAction(examRequests: examRequests.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const FirstExamRequestsFailedAction());
        throw e;
      });
  }
  next(action);
}