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

class SearchUsersWidget extends StatefulWidget {
  const SearchUsersWidget({super.key});

  @override
  State<SearchUsersWidget> createState() => _SearchUsersWidgetState();
}

class _SearchUsersWidgetState extends State<SearchUsersWidget> {
  late final TextEditingController _searchTextController;

  @override
  void initState() {
    _searchTextController = TextEditingController();
    
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(const ChangeActivePageAction(page: 0));
    _searchTextController.text = store.state.searchState.key;

    if(store.state.searchState.key == ""){
      store.dispatch(const GetNextPageSearchedUsersIfNoPageAction());
    }

    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.clear();
    super.dispose();
  }


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
      builder:(context,state) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8,15,8,0),
            child: StoreConnector<AppState,String>(
              converter: (store) => store.state.searchState.key,
              builder: (context, key) => TextField(
                controller: _searchTextController,
                onChanged: (key){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  store.dispatch(ChangeSearchKeyAction(key: key.trim()));
                  if(key == ""){
                    store.dispatch(const GetNextPageSearchedUsersIfNoPageAction());
                  }else{
                    store.dispatch(const GetFirstPageSearchingUsersAction());
                  }
                },
                style: const TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: key != "" ? IconButton(
                    onPressed: (){
                      _searchTextController.clear();
                      final store = StoreProvider.of<AppState>(context,listen: false);
                      store.dispatch(const ClearKeyAction());
                      store.dispatch(const GetNextPageSearchedUsersIfNoPageAction());
                    },
                    icon: const Icon(Icons.clear),
                  ) : null,
                  border: const OutlineInputBorder()
                ),
              )
            ),
          ),
          Container(
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
                onScrollBottom: (){
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
        ],
      ),
    );
  }
}