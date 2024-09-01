import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/search_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/search/widgets/search_question_widget.dart';
import 'package:my_social_app/views/search/widgets/search_users_widget.dart';
import 'package:my_social_app/views/shared/label_pagination_widget/label_pagination_widget.dart';

const labels = ["questions","users"];
const icons = [Icons.question_mark,Icons.person];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final PageController _pageController;
  
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

    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(const ChangeActivePageAction(page: 0));

    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_setPage);
    _pageController.dispose();
        
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      labels[index],
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