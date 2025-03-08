import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/app_state/search_users_state/actions.dart';
import 'package:my_social_app/state/app_state/search_users_state/search_user_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/actions.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/user_user_search_state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/search/pages/search_page/search_page_texts.dart';
import 'package:my_social_app/views/search/widgets/search_users_widget.dart';
import 'package:my_social_app/views/search/widgets/user_user_searchs_widget.dart';
import 'package:my_social_app/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:rxdart/rxdart.dart';

const icons = [Icons.question_mark, Icons.person];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final PageController _pageController = PageController();
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final StreamController<String> _keyStream = StreamController();
  late final StreamSubscription _keyListener;
  late final Iterable<String> _labels;

  double _page = 0;
  void _setPage() => setState(() => _page = _pageController.page ?? 0 );

  void _onKeyChanged(String key){
    setState((){});
    _keyStream.add(key);
  }

  void _listenKey(String key){
    final store = StoreProvider.of<AppState>(context, listen: false);
    if(key == ""){
      getNextPageIfNoPage(store, store.state.userUserSearchs, const NextUserUserSearchsAction());
    }
    else{
      store.dispatch(FirstSearchUsersAction(key: key));
    }
  }

  void _onScrollBottom() =>
    onScrollBottom(
      _scrollController,
      (){
        final store = StoreProvider.of<AppState>(context, listen: false);
        if(_textEditingController.text == ""){
          getNextPageIfReady(store, store.state.userUserSearchs, const NextUserUserSearchsAction());
        }
        else{
          getNextPageIfReady(store, store.state.searchUsers, NextSearchUsersAction(key: _textEditingController.text));
        }
      }
    );

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    _labels = [
      labelQuestion[store.state.loginState!.language]!,
      labelUser[store.state.loginState!.language]!
    ];

    _pageController.addListener(_setPage);

    _keyListener =
      _keyStream.stream
        .debounceTime(const Duration(milliseconds: 400))
        .distinct()
        .listen(_listenKey);
    _keyStream.add(_textEditingController.text);

    _scrollController.addListener(_onScrollBottom);

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
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15, top:15),
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
                      _labels.elementAt(index),
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
                // const SearchQuestionWidget(),
                const Column(),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left:8,right: 8,bottom: 8),
                      child: LanguageWidget(
                        child: (language) => TextField(
                          controller: _textEditingController,
                          onChanged: _onKeyChanged,
                          decoration: InputDecoration(
                            hintText: textFieldHintText[language]
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: _textEditingController.text.isEmpty 
                          ? StoreConnector<AppState, Pagination<int,UserUserSearchState>>(
                              converter: (store) => store.state.userUserSearchs,
                              builder: (context, pagination) => Column(
                                children: [
                                  UserUserSearchsWidget(userUserSearchs: pagination.values),
                                  if(pagination.loadingNext)
                                    const LoadingCircleWidget()
                                ],
                              )
                            )
                          : StoreConnector<AppState,Pagination<int, SearchUserState>>(
                              converter: (store) => store.state.searchUsers,
                              builder: (context, pagination) => Column(
                                children: [
                                  SearchUsersWidget(searchUsers: pagination.values),
                                  if(pagination.loadingNext)
                                    const LoadingCircleWidget()
                                ],
                              ),
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