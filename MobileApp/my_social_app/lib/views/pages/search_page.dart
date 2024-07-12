import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/search_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/user/user_items_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  late final TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StoreConnector<AppState,String>(
          converter: (store) => store.state.searchState.key,
          builder: (context, key){
            if(key != ""){
              return TextField(
                controller: searchTextController,
                onChanged: (key) async{
                  if(key == ""){
                    store.dispatch(const ClearSearchingAction());
                    return;
                  }
                  store.dispatch(SearchAction(key: searchTextController.text));
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: IconButton(
                    onPressed: (){
                      store.dispatch(const ClearSearchingAction());
                      searchTextController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  border: const OutlineInputBorder()
                ),
              );
            }
            return TextField(
              controller: searchTextController,
              onChanged: (value) async{
                if(value == ""){
                  store.dispatch(const ClearSearchingAction());
                  return;
                }
                store.dispatch(SearchAction(key: searchTextController.text));
              },
              decoration: const InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder()
              ),
            );
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: StoreConnector<AppState,List<UserState>>(
          converter: (store) => store.state.searchedUsers,
          builder: (context,users) => UserItemsWidget(state: users),
        ),
      ),
    );
  }
}