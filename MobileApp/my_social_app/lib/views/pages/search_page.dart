import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:my_social_app/providers/app_provider.dart';
import 'package:my_social_app/providers/states/user_state.dart';
import 'package:my_social_app/views/shared/user/user_items_widget.dart';
import 'package:provider/provider.dart';

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
        title: Selector<AppProvider,String>(
          selector: (_,appProvider) => appProvider.key,
          builder: (context, value, child){
            if(value != ""){
              return TextField(
                controller: searchTextController,
                onChanged: (value) async{
                  if(value == ""){
                    context.read<AppProvider>().clearSearch();
                    return;
                  }
                  await context.read<AppProvider>().initSearch(value);
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: IconButton(
                    onPressed: (){
                      context.read<AppProvider>().clearSearch();
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
                  context.read<AppProvider>().clearSearch();
                  return;
                }
                await context.read<AppProvider>().initSearch(value);
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
        child: Selector<AppProvider,UnmodifiableListView<UserState>>(
          selector: (_, userProvider) => userProvider.usersSearched,
          builder: (_,value,__) => UserItemsWidget(state: value),
        ),
      ),
    );
  }
}