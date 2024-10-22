import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_entity_state.dart';
import 'package:redux/redux.dart';

//questions
QuestionEntityState addQuestionReducer(QuestionEntityState prev,AddQuestionAction action)
  => prev.addQuestion(action.value);
QuestionEntityState addQuestionsReducer(QuestionEntityState prev,AddQuestionsAction action)
  => prev.addQuestions(action.questions);
QuestionEntityState removeQuestionReducer(QuestionEntityState prev,DeleteQuestionSuccessAction action)
  => prev.removeQuestion(action.questionId);

//like or dislike questions
QuestionEntityState nextLikesReducer(QuestionEntityState prev,NextQuestionLikesAction action)
  => prev.startLoadingNextLikes(action.questionId);
QuestionEntityState nextLikesSuccessReducer(QuestionEntityState prev,NextQuestionLikesSuccessAction action)
  => prev.addNextPageLikes(action.questionId, action.likeIds);
QuestionEntityState nextLikesFailedReducer(QuestionEntityState prev, NextQuestionLikesFailedAction action)
  => prev.stopLoadingNextLikes(action.questionId);

QuestionEntityState dislikeQuestionSuccessReducer(QuestionEntityState prev, DislikeQuestionSuccessAction action)
  => prev.dislike(action.questionId,action.likeId);
QuestionEntityState likeQuestionSuccessReducer(QuestionEntityState prev, LikeQuestionSuccessAction action)
  => prev.like(action.questionId,action.likeId);
QuestionEntityState addNewLikeReducer(QuestionEntityState prev,AddNewQuestionLikeAction action)
  => prev.addNewLike(action.questionId, action.likeId);

//
QuestionEntityState markSolutionAsCorrectReducer(QuestionEntityState prev, MarkQuestionSolutionAsCorrectAction action)
  => prev.markSolutionAsCorrect(action.questionId,action.solutionId);
QuestionEntityState markSolutionAsIncorrectReducer(QuestionEntityState prev,MarkQuestionSolutionAsIncorrectAction action)
  => prev.markSolutionAsIncorrect(action.questionId,action.solutionId);

//solutions
QuestionEntityState nextSolutionsReducer(QuestionEntityState prev,NextQuestionSolutionsAction action)
  => prev.startLoadingNextSolutions(action.questionId);
QuestionEntityState nextSolutionsSuccessReducer(QuestionEntityState prev,NextQuestionSolutionsSuccessAction action)
  => prev.addNextSolutions(action.questionId, action.solutionIds);
QuestionEntityState nextSolutionsFailedReducer(QuestionEntityState prev,NextQuestionSolutionsFailedAction action)
  => prev.stopLoadingNextSolutions(action.questionId);

//uploading solutions
QuestionEntityState startUploadingSolutionReducer(QuestionEntityState prev, StartUploadingSolutionAction action)
  => prev.startUploadingSolution(action.id, action.questionId, action.content, action.images);
QuestionEntityState startUploadingVideoSolutionReducer(QuestionEntityState prev, StartUploadingVideoSolutionAction action)
  => prev.startUplodingVideoSolution(action.id, action.questionId, action.content, action.video);
QuestionEntityState changeRateReducer(QuestionEntityState prev, ChangeRateAction action)
  => prev.changeRate(action.state,action.rate);
QuestionEntityState removeUploadedSolutionReducer(QuestionEntityState prev,RemoveUploadedSolutionAction action)
  => prev.removeUploadedSolution(action.state);

QuestionEntityState createNewSolutionReducer(QuestionEntityState prev,CreateNewQuestionSolutionAction action)
  => prev.createNewSolution(action.solution);
QuestionEntityState createNewVideoSolutionReducer(QuestionEntityState prev,CreateNewQuestionVideoSolutionAction action)
  => prev.createNewVideoSolution(action.solution);
QuestionEntityState addNewSolutionReducer(QuestionEntityState prev,AddNewQuestionSolutionAction action)
  => prev.addNewSolution(action.questionId,action.solutionId);
QuestionEntityState removeSolutionReducer(QuestionEntityState prev,RemoveQuestionSolutionAction action)
  => prev.removeSolution(action.solution);

//correct solutions
QuestionEntityState nextCorrectSolutionsReducer(QuestionEntityState prev,NextQuestionCorrectSolutionsAction action)
  => prev.startLoadingNextCorrectSolutions(action.questionId);
QuestionEntityState nextCorrectSolutionsSuccessReducer(QuestionEntityState prev,NextQuestionCorrectSolutionsSuccessAction action)
  => prev.addNextPageCorrectSolutions(action.questionId, action.solutionIds);
QuestionEntityState nextCorrectSolutionsFailedReducer(QuestionEntityState prev,NextQuestionCorrectSolutionsFailedAction action)
  => prev.stopLoadingNextCorrectSolutions(action.questionId);

//pending solutions
QuestionEntityState nextPendingSolutionsReducer(QuestionEntityState prev,NextQuestionPendingSolutionsAction action)
  => prev.startLoadingNextPendingSolutions(action.questionId);
QuestionEntityState nextPendingSolutionsSuccessReducer(QuestionEntityState prev,NextQuestionPendingSolutionsSuccessAction action)
  => prev.addNextPagePedingSolutions(action.questionId, action.solutionIds);
QuestionEntityState nextPendingSolutionsFailedReducer(QuestionEntityState prev,NextQuestionPendingSolutionsFailedAction action)
  => prev.stopLoadingNextPendingSolutions(action.questionId);

//incorrect solutions
QuestionEntityState nextIncorrectSolutionsReducer(QuestionEntityState prev,NextQuestionIncorrectSolutionsAction action)
  => prev.startLoadingNextIncorrectSolutions(action.questionId);
QuestionEntityState nextIncorrectSolutionsSuccessReducer(QuestionEntityState prev,NextQuestionIncorrectSolutionsSuccessAction action)
  => prev.addNextPageIncorrectSolutions(action.questionId,action.solutionIds);
QuestionEntityState nextIncorrectSolutionsFailedReducer(QuestionEntityState prev,NextQuestionIncorrectSolutionsFailedAction action)
  => prev.stopLoadingIncorrectSolutions(action.questionId);

//video solutions
QuestionEntityState nextVideoSolutionsReducer(QuestionEntityState prev,NextQuestionVideoSolutionsAction action)
  => prev.startLoadingNextVideoSolutions(action.questionId);
QuestionEntityState nextVideoSolutionsSuccessReducer(QuestionEntityState prev,NextQuestionVideoSolutionsSuccessAction action)
  => prev.addNextVideoSolutions(action.questionId,action.solutionIds);
QuestionEntityState nextVideoSolutionsFailedReducer(QuestionEntityState prev,NextQuestionVideoSolutionsFailedAction action)
  => prev.stopLoadingNextVideoSolutions(action.questionId);
QuestionEntityState addVideoSolutionReducer(QuestionEntityState prev,AddQuestionVideoSolutionAction action)
  => prev.addVideoSolution(action.questionId, action.solutionId);
QuestionEntityState removeVideoSolutionReducer(QuestionEntityState prev,RemoveQuestionVideoSolutionAction action)
  => prev.removeVideoSolution(action.questionId,action.solutionId);

//comments
QuestionEntityState nextPageCommentsReducer(QuestionEntityState prev,NextQuestionCommentsAction action)
  => prev.startLoadingNextComments(action.questionId);
QuestionEntityState nextPageCommentsFailedReducer(QuestionEntityState prev,NextQuestionCommentsFailedAction action)
  => prev.stopLoadinNextComments(action.questionId);
QuestionEntityState nextPageCommentsSuccessReducer(QuestionEntityState prev,NexQuestionCommentsSuccessAction action)
  => prev.addNextPageComments(action.questionId, action.commentIds);
QuestionEntityState addCommentReducer(QuestionEntityState prev,AddQuestionCommentAction action)
  => prev.addComment(action.questionId,action.commenId);
QuestionEntityState removeCommentReducer(QuestionEntityState prev,RemoveQuestionCommentAction action)
  => prev.removeComment(action.questionid, action.commentId);
QuestionEntityState addNewCommentReducer(QuestionEntityState prev,AddNewQuestionCommentAction action)
  => prev.addNewComment(action.questionId,action.commentId);

//images
QuestionEntityState startLoadingImageReducer(QuestionEntityState prev,LoadQuestionImageAction action)
  => prev.startLoadingImage(action.questionId, action.index);
QuestionEntityState loadImageReducer(QuestionEntityState prev,LoadQuestionImageSuccessAction action)
  => prev.loadImage(action.questionId, action.index, action.image);

QuestionEntityState saveReducer(QuestionEntityState prev,SaveQuestionSuccessAction action)
  => prev.save(action.questionId);
QuestionEntityState unsaveReducer(QuestionEntityState prev,UnsaveQuestionSuccessAction action)
  => prev.unsave(action.questionId);

Reducer<QuestionEntityState> questionsReducer = combineReducers<QuestionEntityState>([
  TypedReducer<QuestionEntityState,AddQuestionAction>(addQuestionReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionsAction>(addQuestionsReducer).call,
  TypedReducer<QuestionEntityState,DeleteQuestionSuccessAction>(removeQuestionReducer).call,

  //question likes
  TypedReducer<QuestionEntityState,DislikeQuestionSuccessAction>(dislikeQuestionSuccessReducer).call,
  TypedReducer<QuestionEntityState,LikeQuestionSuccessAction>(likeQuestionSuccessReducer).call,
  TypedReducer<QuestionEntityState,AddNewQuestionLikeAction>(addNewLikeReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionLikesAction>(nextLikesReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionLikesSuccessAction>(nextLikesSuccessReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionLikesFailedAction>(nextLikesFailedReducer).call,

  //
  TypedReducer<QuestionEntityState,MarkQuestionSolutionAsCorrectAction>(markSolutionAsCorrectReducer).call,
  TypedReducer<QuestionEntityState,MarkQuestionSolutionAsIncorrectAction>(markSolutionAsIncorrectReducer).call,

  //uploading solutions
  TypedReducer<QuestionEntityState,StartUploadingSolutionAction>(startUploadingSolutionReducer).call,
  TypedReducer<QuestionEntityState,StartUploadingVideoSolutionAction>(startUploadingVideoSolutionReducer).call,
  TypedReducer<QuestionEntityState,ChangeRateAction>(changeRateReducer).call,
  TypedReducer<QuestionEntityState,RemoveUploadedSolutionAction>(removeUploadedSolutionReducer).call,
  
 

  //solutions
  TypedReducer<QuestionEntityState,NextQuestionSolutionsAction>(nextSolutionsReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionSolutionsSuccessAction>(nextSolutionsSuccessReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionSolutionsFailedAction>(nextSolutionsFailedReducer).call,

  //correct solutions
  TypedReducer<QuestionEntityState,NextQuestionCorrectSolutionsAction>(nextCorrectSolutionsReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionCorrectSolutionsSuccessAction>(nextCorrectSolutionsSuccessReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionCorrectSolutionsFailedAction>(nextCorrectSolutionsFailedReducer).call,

  //pending solutions
  TypedReducer<QuestionEntityState,NextQuestionPendingSolutionsAction>(nextPendingSolutionsReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionPendingSolutionsSuccessAction>(nextPendingSolutionsSuccessReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionPendingSolutionsFailedAction>(nextPendingSolutionsFailedReducer).call,

  //Incorrect solutions
  TypedReducer<QuestionEntityState,NextQuestionIncorrectSolutionsAction>(nextIncorrectSolutionsReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionIncorrectSolutionsSuccessAction>(nextIncorrectSolutionsSuccessReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionIncorrectSolutionsFailedAction>(nextIncorrectSolutionsFailedReducer).call,
  
  //video solutions
  TypedReducer<QuestionEntityState,NextQuestionVideoSolutionsAction>(nextVideoSolutionsReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionVideoSolutionsSuccessAction>(nextVideoSolutionsSuccessReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionVideoSolutionsFailedAction>(nextVideoSolutionsFailedReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionVideoSolutionAction>(addVideoSolutionReducer).call,
  TypedReducer<QuestionEntityState,RemoveQuestionVideoSolutionAction>(removeVideoSolutionReducer).call,

  TypedReducer<QuestionEntityState,CreateNewQuestionSolutionAction>(createNewSolutionReducer).call,
  TypedReducer<QuestionEntityState,CreateNewQuestionVideoSolutionAction>(createNewVideoSolutionReducer).call,
  TypedReducer<QuestionEntityState,AddNewQuestionSolutionAction>(addNewSolutionReducer).call,
  TypedReducer<QuestionEntityState,RemoveQuestionSolutionAction>(removeSolutionReducer).call,

  //comments
  TypedReducer<QuestionEntityState,NextQuestionCommentsAction>(nextPageCommentsReducer).call,
  TypedReducer<QuestionEntityState,NextQuestionCommentsFailedAction>(nextPageCommentsFailedReducer).call,
  TypedReducer<QuestionEntityState,NexQuestionCommentsSuccessAction>(nextPageCommentsSuccessReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionCommentAction>(addCommentReducer).call,
  TypedReducer<QuestionEntityState,RemoveQuestionCommentAction>(removeCommentReducer).call,
  TypedReducer<QuestionEntityState,AddNewQuestionCommentAction>(addNewCommentReducer).call,

  //images
  TypedReducer<QuestionEntityState,LoadQuestionImageAction>(startLoadingImageReducer).call,
  TypedReducer<QuestionEntityState,LoadQuestionImageSuccessAction>(loadImageReducer).call,
  
  TypedReducer<QuestionEntityState,SaveQuestionSuccessAction>(saveReducer).call,
  TypedReducer<QuestionEntityState,UnsaveQuestionSuccessAction>(unsaveReducer).call
]);
