import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/image_state.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void createQuestionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateQuestionAction){
    final state = store.state.createQuestionState;
    QuestionService()
      .createQuestion(state.images, state.examId!, state.subjectId!, state.topicIds, state.content)
      .then((question){
        store.dispatch(CreateQuestionSucessAction(payload: question.toQuestionState()));
        store.dispatch(AddQuestionAction(currentUserId: store.state.accountState!.id, questionId: question.id));
        ToastCreator.displaySuccess("Question is successfully created.");
      });
  }
  next(action);
}

void loadQuestionsByUserIdMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadQuestionsByUserIdAction){
    final user = store.state.userEntityState.users[action.userId]!;
    if(!user.questions.isLast){
      QuestionService()
        .getByUserId(action.userId,lasId: user.questions.lastId)
        .then((questions){
          store.dispatch(
            LoadQuestionsByUserIdSuccessAction(
              payload: questions.map((e) => e.toQuestionState()).toList()
            )
          );
          store.dispatch(
            LoadUserQuestionsAction(
              userId: action.userId,
              payload: questions.map((e) => e.id).toList()
            )
          );
        });
    }
  }
  next(action);
}

void loadQuestionImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadQuestionImageAction){
    final questionImage = store.state.questionEntityState.questions[action.questionId]!.images[action.index];
    if(questionImage.state == ImageState.notStarted){
      QuestionService()
        .getQuestionImage(action.questionId,questionImage.blobName!)
        .then(
          (image) => store.dispatch(
            LoadQuestionImageSuccessAction(
              questionId: action.questionId,
              index: action.index,
              image: image
            )
          )
        );
    }
  }
  next(action);
}

void likeQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is LikeQuestionAction){
    if(store.state.questionEntityState.questions[action.questionId]!.isLiked){
      QuestionService()
        .dislike(action.questionId)
        .then((_) => store.dispatch(DislikeQuestionSuccessAction(questionId: action.questionId)));
    }
    else{
      QuestionService()
        .like(action.questionId)
        .then((_) => store.dispatch(LikeQuestionSuccessAction(questionId: action.questionId)));
    }
  }
  next(action);
}