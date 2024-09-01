import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/account_storage.dart';
import 'package:my_social_app/services/exam_service.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void initAppMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is InitAppAction){
    final accountService = AccountService();
    final accountStorage = AccountStorage();
    accountStorage.get().then((oldAccuntState){
      if(oldAccuntState != null){
        accountService
          .loginByReshtoken(oldAccuntState.id, oldAccuntState.refreshToken)
          .then((account) {
            final newAccountState = account.toAccountState();
            accountStorage.set(newAccountState);
            store.dispatch(ChangeAccessTokenAction(accessToken: account.accessToken));
            store.dispatch(UpdateAccountStateAction(payload: newAccountState));
            store.dispatch(const ApplicationSuccessfullyInitAction());
          })
          .catchError((error){
            store.dispatch(const UpdateAccountStateAction(payload: null));
            store.dispatch(const ApplicationSuccessfullyInitAction());
            throw error;
          });
      }
      else{
        store.dispatch(const ApplicationSuccessfullyInitAction());
      }
    });
  }
  next(action);
}
//exams middlewares
void getNextPageExamsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageExamsIfNoPageAction){
    final pagination = store.state.exams;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(const GetNextPageExamsAction());
    }
  }
  next(action);
}
void getNextPageExamsIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageExamsIfReadyAction){
    final pagination = store.state.exams;
    if(pagination.isReadyForNextPage){
      store.dispatch(const GetNextPageExamsAction());
    }
  }
  next(action);
}
void getNextPageExamsMidleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageExamsAction){
    ExamService()
      .getExams(store.state.exams.next)
      .then((exams){
        store.dispatch(AddExamsAction(exams: exams.map((e) => e.toExamState())));
        store.dispatch(AddNextPageExamsAction(examIds: exams.map((e) => e.id)));
      });
  }
  next(action);
}