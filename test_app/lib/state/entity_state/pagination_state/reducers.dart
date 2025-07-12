import 'package:test_app/state/entity_state/entity.dart';
import 'package:test_app/state/entity_state/pagination_state/actions.dart';
import 'package:test_app/state/entity_state/pagination_state/pagination.dart';

Pagination<K,V> paginationReducer<K extends Comparable,V extends Entity<K>>(Pagination<K,V> prev, action){
  if(action is NextAction){
    return prev.startLoadingNext();
  }
  else if(action is NextSuccessAction<K,V>){
    return prev.addNextPage(action.entities);
  }
  else if(action is NextFailedAction || action is RefreshFailedAction){
    return prev.stopLoadingNext();
  }
  else if(action is RefreshAction){
    return prev.clear().startLoadingNext();
  }
  else if(action is RefreshSuccessAction<K,V>){
    return prev.refreshPage(action.entities);
  }
  else if(action is PrevAction){
    return prev.startLoadingPrev();
  }
  else if(action is PrevSuccessAction<K,V>){
    return prev.addPrevPage(action.entities);
  }
  else{
    return prev.stopLoadingPrev();
  }
}

