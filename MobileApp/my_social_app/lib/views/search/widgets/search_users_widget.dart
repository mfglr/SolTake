import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/search_state/actions.dart';
import 'package:my_social_app/state/app_state/search_state/search_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/widgets/follow_button_widget.dart';
import 'package:my_social_app/views/user/widgets/remove_searched_user_button.dart';
import 'package:my_social_app/views/user/widgets/user_items_widget.dart';

class SearchUsersWidget extends StatelessWidget {
  const SearchUsersWidget({super.key});

  Widget _rigthButtonBuilder(SearchState state,UserState user){
    return 
      state.key == "" ? 
      RemoveSearchedUserButton(user: user) :
      StoreConnector<AppState,int>(
        converter: (store) => store.state.accountState!.id,
        builder: (context,accountId) => accountId != user.id ? FollowButtonWidget(user: user) : const SpaceSavingWidget()
      );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,SearchState>(
      converter: (store) => store.state.searchState,
      builder:(context,state) => Container(
        margin: const EdgeInsets.all(5),
        child: StoreConnector<AppState,Iterable<UserState>>(
          converter: (store){
            if(state.key == "") return store.state.selectSearchedUsers;
            return store.state.searchedUsers;
          },
          builder: (context,users) => UserItemsWidget(
            users: users,
            pagination: state.key == "" ? state.searchedUsers : state.users,
            rigthButtonBuilder: (user) => _rigthButtonBuilder(state,user),
            onPressed: (user){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(AddSearchedUserAction(userId: user.id));
            },
            onScrollBotton: (){
              final store = StoreProvider.of<AppState>(context, listen: false);
              if(state.key != ""){
                store.dispatch(const GetNextPageSearchingUsersIfReadyAction());
              }
              else{
                store.dispatch(const GetNextPageSearchedUsersIfReadyAction());
              }
            },
          ),
        ),
      ),
    );
  }
}