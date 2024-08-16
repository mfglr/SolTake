import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/app_state/create_question_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void createQuestionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateQuestionAction){
    final state = store.state.createQuestionState;
    final currentUserId = store.state.currentUser!.id;
    QuestionService()
      .createQuestion(state.images,state.examId!,state.subjectId!,state.topicIds,state.content)
      .then((question) {
        store.dispatch(AddUserQuestionAction(userId: currentUserId, questionId: question.id));
        store.dispatch(AddQuestionAction(value: question.toQuestionState()));
        ToastCreator.displaySuccess("Question has been successfully created!");
      });
  }
  next(action);
}