import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/search_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void getFirstPageSearchingUsersIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetFirstPageSearchingUsersIfNoPageAction){
    final key = store.state.searchState.key;
    if(key != ""){
      final pagination = store.state.searchState.users;
      if(!pagination.isLast && !pagination.hasAtLeastOnePage){
        store.dispatch(GetFirstPageSearchingUsersAction(key: key));
      }
    }
  }
  next(action);
}
void getFirstPageSearchingUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetFirstPageSearchingUsersAction){
    UserService()
      .search(action.key, null, usersPerPage)
      .then((users){
        store.dispatch(AddFirstPageSearchingUsersAction(key: action.key,userIds: users.map((e) => e.id)));
        store.dispatch(AddUsersAction(users: users.map((e) => e.toUserState())));
        store.dispatch(AddUserImagesAction(images: users.map((e) => UserImageState.init(e.id))));
      });
  }
  next(action);
}
void getNextPageSearchingUsersIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSearchingUsersIfReadyAction){
    final pagination = store.state.searchState.users;
    if(pagination.isReadyForNextPage){
      store.dispatch(const GetNextPageSearchingUsersAction());
    }
  }
  next(action);
}
void getNextPageSearchingUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSearchingUsersAction){
    final key = store.state.searchState.key;
    final lastId = store.state.searchState.users.lastValue;
    UserService()
      .search(key, lastId, usersPerPage)
      .then((users){
        store.dispatch(AddUsersAction(users: users.map((e) => e.toUserState())));
        store.dispatch(AddUserImagesAction(images: users.map((e) => UserImageState.init(e.id))));
        store.dispatch(AddNextPageSearchingUsersAction(userIds: users.map((e) => e.id)));
      });
  }
  next(action);
}

