import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/search_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/search/widgets/search_question_widget.dart';
import 'package:my_social_app/views/search/widgets/label_pagination_widget.dart';
import 'package:my_social_app/views/search/widgets/search_users_widget.dart';
import 'package:rxdart/rxdart.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchTextController;
  late final PageController _pageController;
  late final StreamSubscription<String> _questionKeyConsumer;
  late final StreamSubscription<String> _userKeyConsumer;
  double _page = 0;


  void _setPage(){
    setState(() {
      _page = _pageController.page ?? 0;
      final store = StoreProvider.of<AppState>(context,listen: false);
      final prevPage = store.state.searchState.activePage;
      final nextPage = _page.round();
      if(prevPage != nextPage){
        store.dispatch(ChangeActivePageAction(page: nextPage));
      }
    });
  }

  @override
  void initState() {

    _pageController = PageController();
    _pageController.addListener(_setPage);
    _searchTextController = TextEditingController();

    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(const ChangeActivePageAction(page: 0));
    _searchTextController.text = store.state.searchState.key;

    _questionKeyConsumer = store.onChange
        .map((state) => state.searchState.questionKey)
        .debounceTime(const Duration(milliseconds: 300))
        .distinct()
        .listen((key) => store.dispatch(const GetFirstPageSearchingQuestionsAction()));
    
    _userKeyConsumer = store.onChange
        .map((state) => state.searchState.userKey)
        .debounceTime(const Duration(milliseconds: 300))
        .distinct()
        .listen((key){
          if(key == ""){
            store.dispatch(const GetNextPageSearchedUsersIfNoPageAction());
          }
          else{
            store.dispatch(const GetFirstPageSearchingUsersAction());
          }
        });
    
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.clear();
    _pageController.removeListener(_setPage);
    _pageController.dispose();

    _questionKeyConsumer.cancel();
    _userKeyConsumer.cancel();
        
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                },
                style: const TextStyle(
                  height: 1,
                ),
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: key != "" ? IconButton(
                    onPressed: (){
                      _searchTextController.clear();
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
          Padding(
            padding: const EdgeInsets.only(bottom: 15,top:15),
            child: LabelPaginationWidget(
              initialPage: 0,
              labels: const ["questions","users"],
              page: _page,
              width: MediaQuery.of(context).size.width,
              pageController: _pageController,
            )
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: const [
                SearchQuestionWidget(),
                SearchUsersWidget()
              ]
            ),
          ),
        ],
      ),
    );
  }
}