import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

//questions
EntityState<num,QuestionState> addQuestionReducer(EntityState<num,QuestionState> prev,AddQuestionAction action)
  => prev.appendOne(action.value);
EntityState<num,QuestionState> addQuestionsReducer(EntityState<num,QuestionState> prev,AddQuestionsAction action)
  => prev.appendMany(action.questions);
EntityState<num,QuestionState> removeQuestionReducer(EntityState<num,QuestionState> prev,DeleteQuestionSuccessAction action)
  => prev.where((e) => e.id == action.questionId);

//likes
EntityState<num,QuestionState> likeQuestionSuccessReducer(EntityState<num,QuestionState> prev, LikeQuestionSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.like(action.likeId));
EntityState<num,QuestionState> dislikeQuestionSuccessReducer(EntityState<num,QuestionState> prev, DislikeQuestionSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.dislike(action.likeId));
EntityState<num,QuestionState> nextLikesReducer(EntityState<num,QuestionState> prev,NextQuestionLikesAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLodingNextLikes());
EntityState<num,QuestionState> nextLikesSuccessReducer(EntityState<num,QuestionState> prev,NextQuestionLikesSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextPageLikes(action.likeIds));
EntityState<num,QuestionState> nextLikesFailedReducer(EntityState<num,QuestionState> prev, NextQuestionLikesFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextLikes());
EntityState<num,QuestionState> addNewLikeReducer(EntityState<num,QuestionState> prev,AddNewQuestionLikeAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNewLike(action.likeId));

//solutions
EntityState<num,QuestionState> markSolutionAsCorrectReducer(EntityState<num,QuestionState> prev, MarkQuestionSolutionAsCorrectAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.markSolutionAsCorrect(action.solutionId));
EntityState<num,QuestionState> markSolutionAsIncorrectReducer(EntityState<num,QuestionState> prev,MarkQuestionSolutionAsIncorrectAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.markSolutionAsIncorrect(action.solutionId));
EntityState<num,QuestionState> createNewSolutionReducer(EntityState<num,QuestionState> prev,CreateNewQuestionSolutionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.createNewSolution(action.solutionId));
EntityState<num,QuestionState> createNewVideoSolutionReducer(EntityState<num,QuestionState> prev,CreateNewQuestionVideoSolutionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.createNewVideoSolution(action.solutionId)); 
EntityState<num,QuestionState> addNewSolutionReducer(EntityState<num,QuestionState> prev,AddNewQuestionSolutionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNewSolution(action.solutionId));
EntityState<num,QuestionState> removeSolutionReducer(EntityState<num,QuestionState> prev,RemoveQuestionSolutionAction action)
  => prev.updateOne(prev.getValue(action.solution.questionId)!.removeSolution(action.solution));
EntityState<num,QuestionState> addVideoSolutionReducer(EntityState<num,QuestionState> prev,AddQuestionVideoSolutionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addVideoSolution(action.solutionId));

//get solutions
EntityState<num,QuestionState> nextSolutionsReducer(EntityState<num,QuestionState> prev,NextQuestionSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextSolutions());
EntityState<num,QuestionState> nextSolutionsSuccessReducer(EntityState<num,QuestionState> prev,NextQuestionSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextSolutions(action.solutionIds));
EntityState<num,QuestionState> nextSolutionsFailedReducer(EntityState<num,QuestionState> prev,NextQuestionSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextSolutions());

//get correct solutions
EntityState<num,QuestionState> nextCorrectSolutionsReducer(EntityState<num,QuestionState> prev,NextQuestionCorrectSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextCorrectSolutions());
EntityState<num,QuestionState> nextCorrectSolutionsSuccessReducer(EntityState<num,QuestionState> prev,NextQuestionCorrectSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextPageCorrectSolutions(action.solutionIds));
EntityState<num,QuestionState> nextCorrectSolutionsFailedReducer(EntityState<num,QuestionState> prev,NextQuestionCorrectSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextCorrectSolutions());

//get pending solutions
EntityState<num,QuestionState> nextPendingSolutionsReducer(EntityState<num,QuestionState> prev,NextQuestionPendingSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextPendingSolutions());
EntityState<num,QuestionState> nextPendingSolutionsSuccessReducer(EntityState<num,QuestionState> prev,NextQuestionPendingSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextPagePedingSolutions(action.solutionIds));
EntityState<num,QuestionState> nextPendingSolutionsFailedReducer(EntityState<num,QuestionState> prev,NextQuestionPendingSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextPendingSolutions());

//get incorrect solutions
EntityState<num,QuestionState> nextIncorrectSolutionsReducer(EntityState<num,QuestionState> prev,NextQuestionIncorrectSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextIncorrectSolutions());
EntityState<num,QuestionState> nextIncorrectSolutionsSuccessReducer(EntityState<num,QuestionState> prev,NextQuestionIncorrectSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextIncorrectSolutions(action.solutionIds));
EntityState<num,QuestionState> nextIncorrectSolutionsFailedReducer(EntityState<num,QuestionState> prev,NextQuestionIncorrectSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextIncorrectSolutions());

//get video solutions
EntityState<num,QuestionState> nextVideoSolutionsReducer(EntityState<num,QuestionState> prev,NextQuestionVideoSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextVideoSolutions());
EntityState<num,QuestionState> nextVideoSolutionsSuccessReducer(EntityState<num,QuestionState> prev,NextQuestionVideoSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextPageVideoSolutions(action.solutionIds));
EntityState<num,QuestionState> nextVideoSolutionsFailedReducer(EntityState<num,QuestionState> prev,NextQuestionVideoSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLodingNextVideoSolutions());

//comments
EntityState<num,QuestionState> addCommentReducer(EntityState<num,QuestionState> prev,AddQuestionCommentAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addComment(action.commenId));
EntityState<num,QuestionState> removeCommentReducer(EntityState<num,QuestionState> prev,RemoveQuestionCommentAction action)
  => prev.updateOne(prev.getValue(action.questionid)!.removeComment(action.commentId));
EntityState<num,QuestionState> addNewCommentReducer(EntityState<num,QuestionState> prev,AddNewQuestionCommentAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNewComment(action.commentId)) ;

//get comments
EntityState<num,QuestionState> nextPageCommentsReducer(EntityState<num,QuestionState> prev,NextQuestionCommentsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextComments());
EntityState<num,QuestionState> nextPageCommentsFailedReducer(EntityState<num,QuestionState> prev,NextQuestionCommentsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextComments());
EntityState<num,QuestionState> nextPageCommentsSuccessReducer(EntityState<num,QuestionState> prev,NexQuestionCommentsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextPageComments(action.commentIds));

Reducer<EntityState<num,QuestionState>> questionsReducer = combineReducers<EntityState<num,QuestionState>>([
  TypedReducer<EntityState<num,QuestionState>,AddQuestionAction>(addQuestionReducer).call,
  TypedReducer<EntityState<num,QuestionState>,AddQuestionsAction>(addQuestionsReducer).call,
  TypedReducer<EntityState<num,QuestionState>,DeleteQuestionSuccessAction>(removeQuestionReducer).call,

  //question likes
  TypedReducer<EntityState<num,QuestionState>,DislikeQuestionSuccessAction>(dislikeQuestionSuccessReducer).call,
  TypedReducer<EntityState<num,QuestionState>,LikeQuestionSuccessAction>(likeQuestionSuccessReducer).call,
  TypedReducer<EntityState<num,QuestionState>,AddNewQuestionLikeAction>(addNewLikeReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionLikesAction>(nextLikesReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionLikesSuccessAction>(nextLikesSuccessReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionLikesFailedAction>(nextLikesFailedReducer).call,

  //
  TypedReducer<EntityState<num,QuestionState>,MarkQuestionSolutionAsCorrectAction>(markSolutionAsCorrectReducer).call,
  TypedReducer<EntityState<num,QuestionState>,MarkQuestionSolutionAsIncorrectAction>(markSolutionAsIncorrectReducer).call,

  //solutions
  TypedReducer<EntityState<num,QuestionState>,NextQuestionSolutionsAction>(nextSolutionsReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionSolutionsSuccessAction>(nextSolutionsSuccessReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionSolutionsFailedAction>(nextSolutionsFailedReducer).call,

  //correct solutions
  TypedReducer<EntityState<num,QuestionState>,NextQuestionCorrectSolutionsAction>(nextCorrectSolutionsReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionCorrectSolutionsSuccessAction>(nextCorrectSolutionsSuccessReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionCorrectSolutionsFailedAction>(nextCorrectSolutionsFailedReducer).call,

  //pending solutions
  TypedReducer<EntityState<num,QuestionState>,NextQuestionPendingSolutionsAction>(nextPendingSolutionsReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionPendingSolutionsSuccessAction>(nextPendingSolutionsSuccessReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionPendingSolutionsFailedAction>(nextPendingSolutionsFailedReducer).call,

  //Incorrect solutions
  TypedReducer<EntityState<num,QuestionState>,NextQuestionIncorrectSolutionsAction>(nextIncorrectSolutionsReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionIncorrectSolutionsSuccessAction>(nextIncorrectSolutionsSuccessReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionIncorrectSolutionsFailedAction>(nextIncorrectSolutionsFailedReducer).call,
  
  //video solutions
  TypedReducer<EntityState<num,QuestionState>,NextQuestionVideoSolutionsAction>(nextVideoSolutionsReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionVideoSolutionsSuccessAction>(nextVideoSolutionsSuccessReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionVideoSolutionsFailedAction>(nextVideoSolutionsFailedReducer).call,
  TypedReducer<EntityState<num,QuestionState>,AddQuestionVideoSolutionAction>(addVideoSolutionReducer).call,

  TypedReducer<EntityState<num,QuestionState>,CreateNewQuestionSolutionAction>(createNewSolutionReducer).call,
  TypedReducer<EntityState<num,QuestionState>,CreateNewQuestionVideoSolutionAction>(createNewVideoSolutionReducer).call,
  TypedReducer<EntityState<num,QuestionState>,AddNewQuestionSolutionAction>(addNewSolutionReducer).call,
  TypedReducer<EntityState<num,QuestionState>,RemoveQuestionSolutionAction>(removeSolutionReducer).call,

  //comments
  TypedReducer<EntityState<num,QuestionState>,NextQuestionCommentsAction>(nextPageCommentsReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NextQuestionCommentsFailedAction>(nextPageCommentsFailedReducer).call,
  TypedReducer<EntityState<num,QuestionState>,NexQuestionCommentsSuccessAction>(nextPageCommentsSuccessReducer).call,
  TypedReducer<EntityState<num,QuestionState>,AddQuestionCommentAction>(addCommentReducer).call,
  TypedReducer<EntityState<num,QuestionState>,RemoveQuestionCommentAction>(removeCommentReducer).call,
  TypedReducer<EntityState<num,QuestionState>,AddNewQuestionCommentAction>(addNewCommentReducer).call,
]);
