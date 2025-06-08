import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination getNotPublishedQuestions(Store<AppState> store)
  => store.state.notPublishedQuestions; 

Page getNextNotPublishedQuestionsPage(Store<AppState> store)
  => store.state.notPublishedQuestions.next;

Iterable<QuestionState> selectNotPublishedQuestions(Store<AppState> store)
  => store.state.notPublishedQuestions.values.map((id) => store.state.questionEntityState.getValue(id.id)!);