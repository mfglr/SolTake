import 'package:redux/redux.dart';
import 'package:test_app/state/entity_state/pagination_state/actions.dart';
import 'package:test_app/state/entity_state/pagination_state/pagination_state.dart';

void nextMiddleware<S extends PaginationState>(Store<S> store, action, NextDispatcher next){
  if(action is NextAction){
    final pagination = store.state.selectPagination(action.context);
    pagination
      .callback(pagination.next, parameters: action.parameters)
      .then((entities) => store.dispatch(NextSuccessAction(context: action.context, entities: entities)))
      .catchError((e){
        store.dispatch(NextFailedAction(context: action.context));
        throw e;
      });
  }
  next(action);
}

void refreshMiddleware<S extends PaginationState>(Store<S> store, action, NextDispatcher next){
  if(action is RefreshAction){
    final pagination = store.state.selectPagination(action.context);
    pagination
      .callback(pagination.first, parameters: action.parameters)
      .then((entities) => store.dispatch(RefreshSuccessAction(context: action.context, entities: entities)))
      .catchError((e){
        store.dispatch(RefreshFailedAction(context: action.context));
        throw e;
      });
  }
  next(action);
}

void prevMiddleware<S extends PaginationState>(Store<S> store, action, NextDispatcher next){
  if(action is PrevAction){
    final pagination = store.state.selectPagination(action.context);
    pagination
      .callback(pagination.prev, parameters: action.parameters)
      .then((entities) => store.dispatch(PrevSuccessAction(context: action.context, entities: entities)))
      .catchError((e){
        store.dispatch(PrevFailedAction(context: action.context));
        throw e;
      });
  }
  next(action);
}