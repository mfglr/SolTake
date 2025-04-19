import 'package:my_social_app/services/user_user_block_service.dart';
import 'package:my_social_app/state/app_state/search_users_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/action.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/selectors.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/user_user_block_state.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/actions.dart';
import 'package:redux/redux.dart';

void blockUserMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is BlockUserAction){
    final user = store.state.userEntityState.getValue(action.userId)!;
    UserUserBlockService()
      .create(action.userId)
      .then((response){
        store.dispatch(BlockUserSuccessAction(
          userUserBlockState: UserUserBlockState(
            id: response.id,
            userId: user.id,
            userName: user.userName,
            name: user.name,
            image: user.image
          )
        ));
        store.dispatch(RemoveUserUserSearchAction(searchedId: action.userId));
        store.dispatch(RemoveSearchUserAction(userId: action.userId));
      });
  }
  next(action);
}

void unblockUserMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is UnblockUserAction){
    UserUserBlockService()
      .delete(action.userId)
      .then((response) => store.dispatch(UnblockUserSuccessAction(userId: action.userId)));
  }
  next(action);
}

void nextUserUserBlockMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserUserBlocksAction){
    UserUserBlockService()
      .getBlockeds(selectNextPageOfUserUserBlocks(store))
      .then((userUserBlocks) => store.dispatch(NextUserUserBlocksSuccessAction(userUserBlocks: userUserBlocks.map((e) => e.toState()))))
      .catchError((e) => store.dispatch(const NextUserUserBlocksFailedAction()));      
  }
  next(action);
}