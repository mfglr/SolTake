import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

//questions
EntityState<int,QuestionState> addQuestionReducer(EntityState<int,QuestionState> prev,AddQuestionAction action)
  => prev.appendOne(action.value);
EntityState<int,QuestionState> addQuestionsReducer(EntityState<int,QuestionState> prev,AddQuestionsAction action)
  => prev.appendMany(action.questions);
EntityState<int,QuestionState> removeQuestionReducer(EntityState<int,QuestionState> prev,DeleteQuestionSuccessAction action)
  => prev.removeOne(action.questionId);

//save
EntityState<int,QuestionState> saveQuestionReducer(EntityState<int,QuestionState> prev,SaveQuestionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.save());
EntityState<int,QuestionState> unsaveQuestionReducer(EntityState<int,QuestionState> prev,UnsaveQuestionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.unsave());

//likes
EntityState<int,QuestionState> likeQuestionSuccessReducer(EntityState<int,QuestionState> prev, LikeQuestionSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.like(action.like));
EntityState<int,QuestionState> dislikeQuestionSuccessReducer(EntityState<int,QuestionState> prev, DislikeQuestionSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.dislike(action.userId));

EntityState<int,QuestionState> addNewLikeReducer(EntityState<int,QuestionState> prev,AddNewQuestionLikeAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNewLike(action.like));
EntityState<int,QuestionState> removeNewLikeReducer(EntityState<int,QuestionState> prev,RemoveNewQuestionLikeAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.removeNewLike(action.userId));

EntityState<int,QuestionState> nextLikesReducer(EntityState<int,QuestionState> prev,NextQuestionLikesAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLodingNextLikes());
EntityState<int,QuestionState> nextLikesSuccessReducer(EntityState<int,QuestionState> prev,NextQuestionLikesSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextPageLikes(action.likes));
EntityState<int,QuestionState> nextLikesFailedReducer(EntityState<int,QuestionState> prev, NextQuestionLikesFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextLikes());

//solutions
EntityState<int,QuestionState> markSolutionAsCorrectReducer(EntityState<int,QuestionState> prev, MarkQuestionSolutionAsCorrectAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.markSolutionAsCorrect(action.solutionId));
EntityState<int,QuestionState> markSolutionAsIncorrectReducer(EntityState<int,QuestionState> prev,MarkQuestionSolutionAsIncorrectAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.markSolutionAsIncorrect(action.solutionId));
EntityState<int,QuestionState> createNewSolutionReducer(EntityState<int,QuestionState> prev,CreateNewQuestionSolutionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.createNewSolution(action.solutionId));
EntityState<int,QuestionState> createNewVideoSolutionReducer(EntityState<int,QuestionState> prev,CreateNewQuestionVideoSolutionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.createNewVideoSolution(action.solutionId)); 
EntityState<int,QuestionState> addNewSolutionReducer(EntityState<int,QuestionState> prev,AddNewQuestionSolutionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNewSolution(action.solutionId));
EntityState<int,QuestionState> removeSolutionReducer(EntityState<int,QuestionState> prev,RemoveQuestionSolutionAction action)
  => prev.updateOne(prev.getValue(action.solution.questionId)!.removeSolution(action.solution));
EntityState<int,QuestionState> addVideoSolutionReducer(EntityState<int,QuestionState> prev,AddQuestionVideoSolutionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addVideoSolution(action.solutionId));

//get solutions
EntityState<int,QuestionState> nextSolutionsReducer(EntityState<int,QuestionState> prev,NextQuestionSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextSolutions());
EntityState<int,QuestionState> nextSolutionsSuccessReducer(EntityState<int,QuestionState> prev,NextQuestionSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextSolutions(action.solutionIds));
EntityState<int,QuestionState> nextSolutionsFailedReducer(EntityState<int,QuestionState> prev,NextQuestionSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextSolutions());

//get correct solutions
EntityState<int,QuestionState> nextCorrectSolutionsReducer(EntityState<int,QuestionState> prev,NextQuestionCorrectSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextCorrectSolutions());
EntityState<int,QuestionState> nextCorrectSolutionsSuccessReducer(EntityState<int,QuestionState> prev,NextQuestionCorrectSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextPageCorrectSolutions(action.solutionIds));
EntityState<int,QuestionState> nextCorrectSolutionsFailedReducer(EntityState<int,QuestionState> prev,NextQuestionCorrectSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextCorrectSolutions());

//get pending solutions
EntityState<int,QuestionState> nextPendingSolutionsReducer(EntityState<int,QuestionState> prev,NextQuestionPendingSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextPendingSolutions());
EntityState<int,QuestionState> nextPendingSolutionsSuccessReducer(EntityState<int,QuestionState> prev,NextQuestionPendingSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextPagePedingSolutions(action.solutionIds));
EntityState<int,QuestionState> nextPendingSolutionsFailedReducer(EntityState<int,QuestionState> prev,NextQuestionPendingSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextPendingSolutions());

//get incorrect solutions
EntityState<int,QuestionState> nextIncorrectSolutionsReducer(EntityState<int,QuestionState> prev,NextQuestionIncorrectSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextIncorrectSolutions());
EntityState<int,QuestionState> nextIncorrectSolutionsSuccessReducer(EntityState<int,QuestionState> prev,NextQuestionIncorrectSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextIncorrectSolutions(action.solutionIds));
EntityState<int,QuestionState> nextIncorrectSolutionsFailedReducer(EntityState<int,QuestionState> prev,NextQuestionIncorrectSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextIncorrectSolutions());

//get video solutions
EntityState<int,QuestionState> nextVideoSolutionsReducer(EntityState<int,QuestionState> prev,NextQuestionVideoSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextVideoSolutions());
EntityState<int,QuestionState> nextVideoSolutionsSuccessReducer(EntityState<int,QuestionState> prev,NextQuestionVideoSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextPageVideoSolutions(action.solutionIds));
EntityState<int,QuestionState> nextVideoSolutionsFailedReducer(EntityState<int,QuestionState> prev,NextQuestionVideoSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLodingNextVideoSolutions());

//comments
EntityState<int,QuestionState> addCommentReducer(EntityState<int,QuestionState> prev,AddQuestionCommentAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addComment(action.commenId));
EntityState<int,QuestionState> removeCommentReducer(EntityState<int,QuestionState> prev,RemoveQuestionCommentAction action)
  => prev.updateOne(prev.getValue(action.questionid)!.removeComment(action.commentId));
EntityState<int,QuestionState> addNewCommentReducer(EntityState<int,QuestionState> prev,AddNewQuestionCommentAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNewComment(action.commentId)) ;

//get comments
EntityState<int,QuestionState> nextPageCommentsReducer(EntityState<int,QuestionState> prev,NextQuestionCommentsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextComments());
EntityState<int,QuestionState> nextPageCommentsFailedReducer(EntityState<int,QuestionState> prev,NextQuestionCommentsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextComments());
EntityState<int,QuestionState> nextPageCommentsSuccessReducer(EntityState<int,QuestionState> prev,NexQuestionCommentsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextPageComments(action.commentIds));

Reducer<EntityState<int,QuestionState>> questionsReducer = combineReducers<EntityState<int,QuestionState>>([
  TypedReducer<EntityState<int,QuestionState>,AddQuestionAction>(addQuestionReducer).call,
  TypedReducer<EntityState<int,QuestionState>,AddQuestionsAction>(addQuestionsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,DeleteQuestionSuccessAction>(removeQuestionReducer).call,

  //saves
  TypedReducer<EntityState<int,QuestionState>,SaveQuestionAction>(saveQuestionReducer).call,
  TypedReducer<EntityState<int,QuestionState>,UnsaveQuestionAction>(unsaveQuestionReducer).call,

  //question likes
  TypedReducer<EntityState<int,QuestionState>,DislikeQuestionSuccessAction>(dislikeQuestionSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,LikeQuestionSuccessAction>(likeQuestionSuccessReducer).call,
  
  TypedReducer<EntityState<int,QuestionState>,AddNewQuestionLikeAction>(addNewLikeReducer).call,
  TypedReducer<EntityState<int,QuestionState>,RemoveNewQuestionLikeAction>(removeNewLikeReducer).call,

  TypedReducer<EntityState<int,QuestionState>,NextQuestionLikesAction>(nextLikesReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionLikesSuccessAction>(nextLikesSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionLikesFailedAction>(nextLikesFailedReducer).call,

  //
  TypedReducer<EntityState<int,QuestionState>,MarkQuestionSolutionAsCorrectAction>(markSolutionAsCorrectReducer).call,
  TypedReducer<EntityState<int,QuestionState>,MarkQuestionSolutionAsIncorrectAction>(markSolutionAsIncorrectReducer).call,

  //solutions
  TypedReducer<EntityState<int,QuestionState>,NextQuestionSolutionsAction>(nextSolutionsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionSolutionsSuccessAction>(nextSolutionsSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionSolutionsFailedAction>(nextSolutionsFailedReducer).call,

  //correct solutions
  TypedReducer<EntityState<int,QuestionState>,NextQuestionCorrectSolutionsAction>(nextCorrectSolutionsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionCorrectSolutionsSuccessAction>(nextCorrectSolutionsSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionCorrectSolutionsFailedAction>(nextCorrectSolutionsFailedReducer).call,

  //pending solutions
  TypedReducer<EntityState<int,QuestionState>,NextQuestionPendingSolutionsAction>(nextPendingSolutionsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionPendingSolutionsSuccessAction>(nextPendingSolutionsSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionPendingSolutionsFailedAction>(nextPendingSolutionsFailedReducer).call,

  //Incorrect solutions
  TypedReducer<EntityState<int,QuestionState>,NextQuestionIncorrectSolutionsAction>(nextIncorrectSolutionsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionIncorrectSolutionsSuccessAction>(nextIncorrectSolutionsSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionIncorrectSolutionsFailedAction>(nextIncorrectSolutionsFailedReducer).call,
  
  //video solutions
  TypedReducer<EntityState<int,QuestionState>,NextQuestionVideoSolutionsAction>(nextVideoSolutionsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionVideoSolutionsSuccessAction>(nextVideoSolutionsSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionVideoSolutionsFailedAction>(nextVideoSolutionsFailedReducer).call,
  TypedReducer<EntityState<int,QuestionState>,AddQuestionVideoSolutionAction>(addVideoSolutionReducer).call,

  TypedReducer<EntityState<int,QuestionState>,CreateNewQuestionSolutionAction>(createNewSolutionReducer).call,
  TypedReducer<EntityState<int,QuestionState>,CreateNewQuestionVideoSolutionAction>(createNewVideoSolutionReducer).call,
  TypedReducer<EntityState<int,QuestionState>,AddNewQuestionSolutionAction>(addNewSolutionReducer).call,
  TypedReducer<EntityState<int,QuestionState>,RemoveQuestionSolutionAction>(removeSolutionReducer).call,

  //comments
  TypedReducer<EntityState<int,QuestionState>,NextQuestionCommentsAction>(nextPageCommentsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionCommentsFailedAction>(nextPageCommentsFailedReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NexQuestionCommentsSuccessAction>(nextPageCommentsSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,AddQuestionCommentAction>(addCommentReducer).call,
  TypedReducer<EntityState<int,QuestionState>,RemoveQuestionCommentAction>(removeCommentReducer).call,
  TypedReducer<EntityState<int,QuestionState>,AddNewQuestionCommentAction>(addNewCommentReducer).call,
]);
