import 'package:my_social_app/constants/record_per_page.dart';
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
          store.dispatch(AddUserImageAction(image: UserImageState.init(question.appUserId)));
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
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
        store.dispatch(AddSolutionImagesListsAction(lists: solutions.map((e) => e.images.map((e) => e.toSolutionImageState()))));
        store.dispatch(NextPageQuestionSolutionsSuccessAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddUserImagesAction(images: solutions.map((e) => UserImageState.init(e.appUserId))));
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

void getNextPageQuestionCommentsIfNoPageCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageQuestionCommentsIfNoPageAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.comments;
    if(!pagination.isLast && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageQuestionCommentsAction(questionId: action.questionId));
    }
  }
  next(action);
}
void getNextPageQuestionCommentIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageQuestionCommentsIfReadyAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.comments;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageQuestionCommentsAction(questionId: action.questionId));
    }
  }
  next(action);
}
void nextPageQuestionCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageQuestionCommentsAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.comments;
    CommentService()
      .getCommentsByQuestionId(action.questionId, pagination.lastValue, commentsPerPage)
      .then((comments){
        store.dispatch(AddCommentsAction(comments: comments.map((e) => e.toCommentState())));
        store.dispatch(AddUserImagesAction(images: comments.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddNextPageQuestionCommentsAction(questionId: action.questionId,commentIds: comments.map((e) => e.id)));
      });
  }
  next(action);
}
