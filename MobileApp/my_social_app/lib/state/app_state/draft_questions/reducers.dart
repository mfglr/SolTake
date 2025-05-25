import 'package:my_social_app/state/app_state/draft_questions/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int, QuestionState> nextDraftQuestionsReducer(Pagination<int, QuestionState> prev, NextDraftQuestionsAction action)
  => prev.startLoadingNext();
Pagination<int, QuestionState> nextDraftQuestionsSuccessReducer(Pagination<int, QuestionState> prev, NextDraftQuestionsSuccessAction action)
  => prev.addfirstPage(action.questions);
Pagination<int, QuestionState> nextDraftQuestionsFailedReducer(Pagination<int, QuestionState> prev, NextDraftQuestionsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<int,QuestionState>> dratfQuestionsReducers = combineReducers<Pagination<int,QuestionState>>([
  TypedReducer<Pagination<int,QuestionState>,NextDraftQuestionsAction>(nextDraftQuestionsReducer).call,
  TypedReducer<Pagination<int,QuestionState>,NextDraftQuestionsSuccessAction>(nextDraftQuestionsSuccessReducer).call,
  TypedReducer<Pagination<int,QuestionState>,NextDraftQuestionsFailedAction>(nextDraftQuestionsFailedReducer).call,
]);