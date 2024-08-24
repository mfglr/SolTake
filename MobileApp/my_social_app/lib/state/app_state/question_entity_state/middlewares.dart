import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/image_status.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void loadQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is LoadQuestionAction){
    if(store.state.questionEntityState.entities[action.questionId] == null){
      QuestionService()
        .getById(action.questionId)
        .then((question){
          store.dispatch(AddQuestionAction(value: question.toQuestionState()));
          store.dispatch(AddUserImageAction(image: UserImageState.init(question.appUserId)));
          store.dispatch(AddExamAction(exam: question.exam.toExamState()));
          store.dispatch(AddSubjectAction(subject: question.subject.toSubjectState()));
          store.dispatch(AddTopicsAction(topics: question.topics.map((e) => e.toTopicState())));
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

void getNextPageQuestionSolutionIfNoPageMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is GetNextPageQuestionSolutionsIfNoPageAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.solutions;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageQuestionSolutionsAction(questionId: action.questionId));
    }
  }
  next(action);
}
void getNextPageQuestionSolutionsIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageQuestionSolutionsIfReadyAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.solutions;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageQuestionSolutionsAction(questionId: action.questionId));
    }
  }
  next(action);
}
void getNextPageQuestionSolutionsMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is GetNextPageQuestionSolutionsAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.solutions;
    SolutionService()
      .getSolutionsByQuestionId(action.questionId,pagination.lastValue,solutionsPerPage,true)
      .then((solutions){
        store.dispatch(AddNextPageQuestionSolutionsAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
        store.dispatch(AddUserImagesAction(images: solutions.map((e) => UserImageState.init(e.appUserId))));
      });
  }
  next(action);
}

void getNextPageQuestionCorrectSolutionsIfNoPageMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is GetNextPageQuestionCorrectSolutionsIfNoPageAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.correctSolutions;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageQuestionCorrectSolutionsAction(questionId: action.questionId));
    }
  }
  next(action);
}
void getNextPageQuestionCorrectSolutionsIfReadyMiddleware(Store<AppState> store, action, NextDispatcher next){
   if(action is GetNextPageQuestionCorrectSolutionsIfReadyAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.correctSolutions;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageQuestionCorrectSolutionsAction(questionId: action.questionId));
    }
  }
  next(action);
}
void getNextPageQuestionCorrectSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is GetNextPageQuestionCorrectSolutionsAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.correctSolutions;
    SolutionService()
      .getCorrectSolutionsByQuestionId(action.questionId, pagination.lastValue, solutionsPerPage, true)
      .then((solutions){
        store.dispatch(AddNextPageQuestionCorrectSolutionsAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
        store.dispatch(AddUserImagesAction(images: solutions.map((e) => UserImageState.init(e.appUserId))));
      });
  }
  next(action);
}

void getNextPageQuestionPendingSolutionsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageQuestionPendingSolutionsIfNoPageAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.pendingSolutions;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageQuestionPendingSolutionsAction(questionId: action.questionId));
    }
  }
  next(action);
}
void getNextPageQuestionPendingSolutionsIfReadMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageQuestionPendingSolutionsIfReadyAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.pendingSolutions;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageQuestionPendingSolutionsAction(questionId: action.questionId));
    }
  }
  next(action);
}
void getNextPageQuestionPendingSolutionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageQuestionPendingSolutionsAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.pendingSolutions;
    SolutionService()
      .getPendingSolutionsByQuestionId(action.questionId, pagination.lastValue, solutionsPerPage, true)
      .then((solutions){
        store.dispatch(AddNextPageQuestionPendingSolutionsAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
        store.dispatch(AddUserImagesAction(images: solutions.map((e) => UserImageState.init(e.appUserId))));
      });
  }
  next(action);
}

void getNextPageQuestionIncorrectSolutionsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageQuestionIncorrectSolutionsIfNoPageAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.incorrectSolutions;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageQuestionIncorrectSolutionsAction(questionId: action.questionId));
    }
  }
  next(action);
}
void getNextPageQuestionIncorrectSolutionsIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageQuestionIncorrectSolutionsIfReadyAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.incorrectSolutions;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageQuestionIncorrectSolutionsAction(questionId: action.questionId));
    }
  }
  next(action);
}
void getNextPageQuestionIncorrectSolutionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageQuestionIncorrectSolutionsAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.incorrectSolutions;
    SolutionService()
      .getIncorrectSolutionsByQuestionId(action.questionId, pagination.lastValue, solutionsPerPage, true)
      .then((solutions){
        store.dispatch(AddNextPageQuestionIncorrectSolutionsAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
        store.dispatch(AddUserImagesAction(images: solutions.map((e) => UserImageState.init(e.appUserId))));
      });
  }
  next(action);
}

void getNextPageQuestionCommentsIfNoPageCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageQuestionCommentsIfNoPageAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.comments;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
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
      .getCommentsByQuestionId(action.questionId, pagination.lastValue, commentsPerPage, true)
      .then((comments){
        store.dispatch(AddCommentsAction(comments: comments.map((e) => e.toCommentState())));
        store.dispatch(AddUserImagesAction(images: comments.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddNextPageQuestionCommentsAction(questionId: action.questionId,commentIds: comments.map((e) => e.id)));
      });
  }
  next(action);
}

void loadQuestionImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadQuestionImageAction){
    final image = store.state.questionEntityState.entities[action.questionId]!.images.elementAt(action.index);
    if(image.state == ImageStatus.notStarted){
      QuestionService()
        .getQuestionImage(action.questionId, image.id)
        .then((image) => store.dispatch(
            LoadQuestionImageSuccessAction(questionId: action.questionId, index: action.index,image: image)
        ));
    }
  }
  next(action);
}
