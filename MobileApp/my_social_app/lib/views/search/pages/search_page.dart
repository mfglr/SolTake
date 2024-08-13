import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/search_state/actions.dart';
import 'package:my_social_app/state/search_state/search_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/search/widgets/search_question_widget.dart';
import 'package:my_social_app/views/search/widgets/label_pagination_widget.dart';
import 'package:my_social_app/views/search/widgets/search_users_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchTextController;
  late final PageController _pageController;
  double _page = 0;


  void _setPage(){
    setState(() {
      _page = _pageController.page ?? 0;
    });
  }

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    _pageController = PageController();
    _pageController.addListener(_setPage);
    _searchTextController = TextEditingController();
    _searchTextController.text = store.state.searchState.key;
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.clear();
    _pageController.removeListener(_setPage);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,SearchState>(
      converter: (store) => store.state.searchState,
      builder: (context,searchState) => Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8,15,8,0),
              child: StoreConnector<AppState,String>(
                converter: (store) => store.state.searchState.key,
                builder: (context, key) => TextField(
                  controller: _searchTextController,
                  onChanged: (key){
                    final trimKey = key.trim();
                    if(trimKey == ""){
                      store.dispatch(const ClearSearchingAction());
                      store.dispatch(const GetFirstPageSearchingQuestionsAction());
                      return;
                    }
                    store.dispatch(ChangeSearchKeyAction(key: trimKey));
                    store.dispatch(const GetFirstPageSearchingUsersAction());
                    store.dispatch(const GetFirstPageSearchingQuestionsAction());
                  },
                  style: const TextStyle(
                    height: 1,
                  ),
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: key != "" ? IconButton(
                      onPressed: (){
                        store.dispatch(const ClearSearchingAction());
                        store.dispatch(const GetFirstPageSearchingQuestionsAction());
                        _searchTextController.clear();
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
                children: [
                  SearchQuestionWidget(state: searchState),
                  SearchUsersWidget(state: searchState)
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}