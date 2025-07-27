import 'package:my_social_app/state/app_state/search_page_state/search_page_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

SearchPageState selectSearchPageState(Store<AppState> store) => store.state.searchPageState;