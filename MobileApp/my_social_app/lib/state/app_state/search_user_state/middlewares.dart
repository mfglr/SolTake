import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/search_user_state/actions.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:redux/redux.dart';

void firstSearchUsersMiddleware(Store<AppAction> store,action,NextDispatcher next){
  if(action is FirstSearchUsersAction){
    UserService()
      .search(action.key, Page.init(usersPerPage, true))
      .then(())
  }
  next(action);
}