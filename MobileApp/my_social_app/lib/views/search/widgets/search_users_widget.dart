import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/search_state/actions.dart';
import 'package:my_social_app/state/app_state/search_state/search_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/widgets/follow_button_widget.dart';
import 'package:my_social_app/views/user/widgets/remove_searched_user_button.dart';
import 'package:my_social_app/views/user/widgets/user_items_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rxdart/rxdart.dart';

class SearchUsersWidget extends StatefulWidget {
  const SearchUsersWidget({super.key});

  @override
  State<SearchUsersWidget> createState() => _SearchUsersWidgetState();
}

class _SearchUsersWidgetState extends State<SearchUsersWidget> {
  late final TextEditingController _searchTextController;
  late BehaviorSubject<String> _keyStream; 
  late StreamSubscription<String> _keyConsumer; 

  @override
  void initState() {
    _searchTextController = TextEditingController();
    
    final store = StoreProvider.of<AppState>(context,listen: false);
    _searchTextController.text = store.state.searchState.key;
    _keyStream = BehaviorSubject();
    _keyStream.add(store.state.searchState.key);
    
    _keyConsumer = _keyStream.stream
      .debounceTime(const Duration(milliseconds: 500))
      .map((key) => key.trim())
      .distinct()
      .listen((key){
        if(mounted){
          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(ChangeSearchKeyAction(key: key.trim()));
          if(key == ""){
            getNextPageIfNoPage(store, store.state.searchState.searchedUsers, const NextSearchedUsersAction());
          }else{
            store.dispatch(const FirstSearchingUsersAction());
          }
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _keyConsumer.cancel();
    super.dispose();
  }


  Widget _rigthButtonBuilder(SearchState state,UserState user){
    return 
      state.key == "" ? 
      RemoveSearchedUserButton(user: user) :
      StoreConnector<AppState,int>(
        converter: (store) => store.state.loginState!.id,
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
                onChanged: (key) =>_keyStream.add(key),
                style: const TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.search_users_widget_search_field_hint_text,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: key != "" ? IconButton(
                    onPressed: (){
                      _searchTextController.clear();
                      _keyStream.add("");
                      final store = StoreProvider.of<AppState>(context,listen: false);
                      store.dispatch(const ClearKeyAction());
                    },
                    icon: const Icon(Icons.clear),
                  ) : null,
                  border: const OutlineInputBorder()
                ),
              )
            ),
          ),
          Expanded(
            child: Container(
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
                      getNextPageIfReady(store, state.users, const NextSearchingUsersAction());
                    }
                    else{
                      getNextPageIfReady(store, state.searchedUsers, const NextSearchedUsersAction());
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}