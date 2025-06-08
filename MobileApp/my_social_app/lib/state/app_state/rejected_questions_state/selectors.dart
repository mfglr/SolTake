import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

Iterable<QuestionState> selectRejectedQuestions(Store<AppState> store)
  => store.state.rejectedQuestions.values.map((id) => store.state.questionEntityState.getValue(id.id)!);