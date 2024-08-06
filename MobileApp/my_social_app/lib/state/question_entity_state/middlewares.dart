import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/image_status.dart';
import 'package:my_social_app/state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/question_image_state.dart';
import 'package:my_social_app/state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/solution_image_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';


void loadQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is LoadQuestionAction){
    if(store.state.questionEntityState.entities[action.questionId] == null){
      QuestionService()
        .getById(action.questionId)
        .then((question){
          store.dispatch(AddQuestionAction(value: question.toQuestionState()));
          store.dispatch(
            AddQuestionImagesAction(
              values: question.images.map((e) => QuestionImageState(
                id: e.id,
                questionId: e.questionId,
                height: e.height,
                width: e.width,
                blobName: e.blobName,
                state: ImageStatus.notStarted,
                image: null
              )
            ))
          );
          store.dispatch(
            AddUserImageAction(
              image: UserImageState(id: question.appUserId,image: null,state: ImageStatus.notStarted)
            )
          );
        });
    }
  }
  next(action);
}

void likeQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is LikeQuestionAction){
      QuestionService()
        .like(action.questionId)
        .then((_) => store.dispatch(LikeQuestionSuccessAction(questionId: action.questionId)));
  }
  next(action);
}
void dislikeQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is DislikeQuestionAction){
    QuestionService()
      .dislike(action.questionId)
      .then((_) => store.dispatch(DislikeQuestionSuccessAction(questionId: action.questionId)));
  }
  next(action);
}

void nextPageQuestionSolutionsMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is NextPageQuestionSolutionsAction){
    final state = store.state.questionEntityState.entities[action.questionId]!.solutions;
    if(!state.isLast){
      SolutionService()
      .getByQuestionId(action.questionId,lastValue: state.lastValue)
      .then((solutions){
        store.dispatch(
          AddSolutionsAction(
            solutions: solutions.map((e) => e.toSolutionState())
          )
        );

        store.dispatch(
          AddSolutionImagesListsAction(
            lists: solutions.map((e) => e.images.map((e) => e.toSolutionImageState()))
          )
        );

        store.dispatch(
          NextPageQuestionSolutionsSuccessAction(
            questionId: action.questionId, 
            solutionIds: solutions.map((e) => e.id)
          )
        );

        store.dispatch(
          AddUserImagesAction(
            images: solutions.map((e) => UserImageState(id: e.appUserId, image: null, state: ImageStatus.notStarted))
          )
        );
      });
    }
  }
  next(action);
}
void nextPageQuestionSolutionIfNoSolutionsMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is NextPageQuestionSolutionsIfNoSolutionsAction){
    final solutions = store.state.questionEntityState.entities[action.questionId]!.solutions;
    if(!solutions.isLast && solutions.ids.isEmpty){
      store.dispatch(NextPageQuestionSolutionsAction(questionId: action.questionId));
    }
  }
  next(action);
}

void nextPageQuestionCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageQuestionCommentsAction){
    final comments = store.state.questionEntityState.entities[action.questionId]!.comments;
    if(!comments.isLast){
      CommentService()
        .getByQuestionId(action.questionId, comments.lastValue)
        .then((comments){
          store.dispatch(
            AddCommentsAction(
              comments: comments.map((e) => e.toCommentState())
            )
          );

          store.dispatch(
            NextPageQuestionCommentsSuccessAciton(
              questionId: action.questionId,
              questionCommentIds: comments.map((e) => e.id)
            )
          );

          store.dispatch(
            AddUserImagesAction(
              images: comments.map((e) => UserImageState(id: e.appUserId, image: null, state: ImageStatus.notStarted))
            )
          );
        });
    }
  }
  next(action);
}
void nextPageQuestionCommentIfNoQuestionCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageQuestionCommentsIfNoQuestionComments){
    final comments = store.state.questionEntityState.entities[action.questionId]!.comments;
    if(comments.ids.isEmpty){
      store.dispatch(
        NextPageQuestionCommentsAction(
          questionId: action.questionId
        )
      );
    }
  }
  next(action);
}