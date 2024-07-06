import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:my_social_app/providers/app_provider.dart';
import 'package:my_social_app/providers/user_state.dart';
import 'package:my_social_app/views/shared/user/user_items_widget.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
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