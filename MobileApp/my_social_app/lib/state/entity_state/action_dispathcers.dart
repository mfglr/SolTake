import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';
import 'package:my_social_app/state/app_state/state.dart';


void getNextPageIfNoPage(Store<AppState> store, Pagination pagination, action){
  if(pagination.noPage){
    store.dispatch(action);
  }
}
void getNextPageIfReady(Store<AppState> store, Pagination pagination, action){
  if(pagination.isReadyForNextPage){
    store.dispatch(action);
  }
}
void getPrevPageIfReady(Store<AppState> store, Pagination pagination, action){
  if(pagination.isReadyForPrevPage){
    store.dispatch(action);
  }
}

void getNextEntitiesIfReady(Store<AppState> store, Pagination pagination, action){
  if(pagination.isReadyForNextPage){
    store.dispatch(action);
  }
}
void getNextEntitiesIfNoPage(Store<AppState> store, Pagination pagination, action){
  if(pagination.noPage){
    store.dispatch(action);
  }
}
void getPrevEntitiesIfReady(Store<AppState> store, Pagination pagination, action){
  if(pagination.isReadyForPrevPage){
    store.dispatch(action);
  }
}

void refreshEntities(Store<AppState> store, Pagination pagination, action){
  if(!pagination.loadingNext){
    store.dispatch(action);
  }
}