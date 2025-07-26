import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

QuestionState? selectQuestion(Store<AppState> store,int questionId)
  => store.state.questionEntityState.getValue(questionId);




