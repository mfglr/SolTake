import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/search_users_state/actions.dart';
import 'package:my_social_app/state/app_state/search_users_state/search_user_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/actions.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/user_user_search_state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/search/widgets/search_question_widget.dart';
import 'package:my_social_app/views/search/widgets/search_users_widget.dart';
import 'package:my_social_app/views/search/widgets/user_user_searchs_widget.dart';
import 'package:my_social_app/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rxdart/rxdart.dart';

const icons = [Icons.question_mark, Icons.person];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final PageController _pageController;
  late final TextEditingController _textEditingController;
  late final StreamController<String> _keyStream;
  late final StreamSubscription _keyListener;

  double _page = 0;
  void _setPage(){
    setState(() {
      _page = _pageController.page ?? 0;
    });
  }

  void _onKeyChanged(String key) => _keyStream.add(key);

  void _listenKey(String key){
    final store = StoreProvider.of<AppState>(context,listen: false);
    if(key == ""){
      getNextPageIfNoPage(store,store.state.userUserSearchs,const NextUserUserSearchsAction());
    }
    else{
      store.dispatch(FirstSearchUsersAction(key: key));
    }
  }


  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(_setPage);

    _textEditingController = TextEditingController();

    _keyStream = StreamController();
    _keyStream.add("");
    _keyListener = 
      _keyStream.stream
        .debounceTime(const Duration(milliseconds: 500))
        .distinct()
        .listen(_listenKey);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_setPage);
    _pageController.dispose();
    _textEditingController.dispose();
    _keyListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Iterable<String> labels = [
      AppLocalizations.of(context)!.search_page_label_question,
      AppLocalizations.of(context)!.search_page_label_user,
    ];
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15,top:15),
            child: LabelPaginationWidget(
              initialPage: 0,
              labelCount: 2,
              labelBuilder: (isActive,index){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icons[index],
                      color: isActive ? Colors.black : Colors.grey
                    ),
                    Text(
                      labels.elementAt(index),
                      style: TextStyle(
                        color: isActive ? Colors.black : Colors.grey
                      ),
                    ),
                  ],
                );
              },
              page: _page,
              width: MediaQuery.of(context).size.width,
              pageController: _pageController,
            )
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                const SearchQuestionWidget(),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left:8,right: 8),
                      child: TextField(
                        controller: _textEditingController,
                        onChanged: _onKeyChanged,
                        decoration: const InputDecoration(
                          hintText: "Search Users"
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: _textEditingController.text.isEmpty 
                        ? StoreConnector<AppState,Pagination<int,UserUserSearchState>>(
                            converter: (store) => store.state.userUserSearchs,
                            builder:(context, pagination) => UserUserSearchsWidget(
                              userUserSearchs: pagination.values
                            )
                          )
                        : StoreConnector<AppState,Pagination<int, SearchUserState>>(
                            converter: (store) => store.state.searchUsers,
                            builder: (context,pagination) => SearchUsersWidget(
                              searchUsers: pagination.values
                            ),
                          ),
                    ),
                  ],
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}