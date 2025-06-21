import 'package:my_social_app/services/subject_requests_service.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_request_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_request_state/subject_request_state.dart';
import 'package:my_social_app/state/app_state/subject_request_state/subject_request_status.dart';
import 'package:redux/redux.dart';

void createSubjectRequestMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is CreateSubjectRequestAction){
    SubjectRequestsService
      .create(action.exam.id, action.name)
      .then((response) => store.dispatch(CreateSubjectRequestSuccessAction(
        subjectRequest: SubjectRequestState(
          id: response.id,
          createdAt: DateTime.now(),
          name: action.name,
          examId: action.exam.id,
          examName: action.exam.name,
          state: SubjectRequestStatus.pending,
          reason: null
        )
      )));
  }
  next(action);
}

void deleteSubjectRequestMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is DeleteSubjectRequestAction){
    SubjectRequestsService
      .delete(action.id)
      .then((_) => store.dispatch(DeleteSubjectRequestSuccessAction(id: action.id)));
  }
  next(action);
}

void nextSubjectRequestsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextSubjectRequestsAction){
    SubjectRequestsService
      .getSubjectRequests(store.state.subjectRequests.next)
      .then((e) => store.dispatch(NextSubjectRequestsSuccessAction(subjectRequests: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const NextSubjectRequestsFailedAction());
        throw e;
      });
  }
  next(action);
}

void firstSubjectRequestsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is FirstSubjectRequestsAction){
    SubjectRequestsService
      .getSubjectRequests(store.state.subjectRequests.first)
      .then((e) => store.dispatch(FirstSubjectRequestsSuccessAction(subjectRequests: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const FirstSubjectRequestsFailedAction());
        throw e;
      });
  }
  next(action);
}