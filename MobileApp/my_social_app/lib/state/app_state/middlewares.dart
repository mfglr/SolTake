import 'package:my_social_app/services/exam_service.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

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
//exams middlewares//


