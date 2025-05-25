import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination getDraftQuestions(Store<AppState> store)
  => store.state.draftQuestions; 

Page getNextDraftQuestionsPage(Store<AppState> store)
  => store.state.draftQuestions.next;

Iterable<QuestionState> selectDraftQuestions(Store<AppState> store)
  => store.state.draftQuestions.values.map((id) => store.state.questionEntityState.getValue(id.id)!);