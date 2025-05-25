import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination getNextDraftQuestions(Store<AppState> store)
  => store.state.draftQuestions; 

Page getNextDraftQuestionsPage(Store<AppState> store)
  => store.state.draftQuestions.next; 