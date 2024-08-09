import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/search_state/actions.dart';
import 'package:my_social_app/state/search_state/search_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/user/widgets/user_items_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final String initialKey = store.state.searchState.key;
  late final TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    searchTextController.text = initialKey;
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,SearchState>(
      converter: (store) => store.state.searchState,
      builder: (context,searchState) => Scaffold(
        appBar: AppBar(
          title: StoreConnector<AppState,String>(
            converter: (store) => store.state.searchState.key,
            builder: (context, key) => TextField(
              controller: searchTextController,
              onChanged: (key){
                final trimKey = key.trim();
                if(trimKey == ""){
                  store.dispatch(const ClearSearchingAction());
                  return;
                }
                store.dispatch(GetFirstPageSearchingUsersAction(key: trimKey));
              },
              decoration: InputDecoration(
                hintText: "Search",
                suffixIcon: key != "" ? IconButton(
                  onPressed: (){
                    store.dispatch(const ClearSearchingAction());
                    searchTextController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ) : null,
                border: const OutlineInputBorder()
              ),
            )
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(5),
          child: StoreConnector<AppState,Iterable<UserState>>(
            onInit: (store) => store.dispatch(const GetFirstPageSearchingUsersIfNoPageAction()),
            converter: (store) => store.state.searchedUsers,
            builder: (context,users) => UserItemsWidget(
              users: users,
              pagination: searchState.users,
              onScrollBotton: (){
                final store = StoreProvider.of<AppState>(context, listen: false);
                store.dispatch(const GetNextPageSearchingUsersIfReadyAction());
              },
            ),
          ),
        ),
      ),
    );
  }
}