import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:redux/redux.dart';

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