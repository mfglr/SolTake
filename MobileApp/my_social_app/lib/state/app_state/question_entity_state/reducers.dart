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
QuestionEntityState getNextPageLikesReducer(QuestionEntityState prev,GetNextPageQuestionLikesAction action)
  => prev.startLoadingNextLikes(action.questionId);
QuestionEntityState addNextPageLikesReducer(QuestionEntityState prev,AddNextPageQuestionLikesAction action)
  => prev.addNextPageLikes(action.questionId, action.likeIds);
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
QuestionEntityState getNextPageSolutionsReducer(QuestionEntityState prev,GetNextPageQuestionSolutionsAction action)
  => prev.getNextPageSolutions(action.questionId);
QuestionEntityState addNextPageSolutionsReducer(QuestionEntityState prev,AddNextPageQuestionSolutionsAction action)
  => prev.addNextPageSolutions(action.questionId, action.solutionIds);
QuestionEntityState createNewSolutionReducer(QuestionEntityState prev,CreateNewQuestionSolutionAction action)
  => prev.createNewSolution(action.solution);
QuestionEntityState createNewVideoSolutionReducer(QuestionEntityState prev,CreateNewQuestionVideoSolutionAction action)
  => prev.createNewVideoSolution(action.solution);
QuestionEntityState addNewSolutionReducer(QuestionEntityState prev,AddNewQuestionSolutionAction action)
  => prev.addNewSolution(action.questionId,action.solutionId);
QuestionEntityState removeSolutionReducer(QuestionEntityState prev,RemoveQuestionSolutionAction action)
  => prev.removeSolution(action.solution);

//correct solutions
QuestionEntityState getNextPageCorrectSolutionsReducer(QuestionEntityState prev,GetNextPageQuestionCorrectSolutionsAction action)
  => prev.getNextPageCorrectSolutions(action.questionId);
QuestionEntityState addNextPageCorrectSolutionsReducer(QuestionEntityState prev,AddNextPageQuestionCorrectSolutionsAction action)
  => prev.addNextPageCorrectSolutions(action.questionId, action.solutionIds);
//pending solutions
QuestionEntityState getNextPagePendingSolutionsReducer(QuestionEntityState prev,GetNextPageQuestionPendingSolutionsAction action)
  => prev.startLoadingNextPendingSolutions(action.questionId);
QuestionEntityState addNextPagePendingSolutionsReducer(QuestionEntityState prev,AddNextPageQuestionPendingSolutionsAction action)
  => prev.addNextPagePedingSolutions(action.questionId, action.solutionIds);
//incorrect solutions
QuestionEntityState getNextPageIncorrectSolutionsReducer(QuestionEntityState prev,GetNextPageQuestionIncorrectSolutionsAction action)
  => prev.startLoadingNextIncorrectSolutions(action.questionId);
QuestionEntityState addNextPageIncorrectSolutionsReducer(QuestionEntityState prev,AddNextPageQuestionIncorrectSolutionsAction action)
  => prev.addNextPageIncorrectSolutions(action.questionId,action.solutionIds);

//video solutions
QuestionEntityState getNextPageVideoSolutionsReducer(QuestionEntityState prev,GetNextPageQuestionVideoSolutionsAction action)
  => prev.startLoadingNextVideoSolutions(action.questionId);
QuestionEntityState addNextPageVideoSolutionReducer(QuestionEntityState prev,AddNextPageQuestionVideoSolutionsAction action)
  => prev.addNextPageVideoSolutions(action.questionId,action.solutionIds);
QuestionEntityState addVideoSolutionReducer(QuestionEntityState prev,AddQuestionVideoSolutionAction action)
  => prev.addVideoSolution(action.questionId, action.solutionId);
QuestionEntityState removeVideoSolutionReducer(QuestionEntityState prev,RemoveQuestionVideoSolutionAction action)
  => prev.removeVideoSolution(action.questionId,action.solutionId);

//comments
QuestionEntityState getNextPageCommentsReducer(QuestionEntityState prev,GetNextPageQuestionCommentsAction action)
  => prev.getNextPageComments(action.questionId);
QuestionEntityState addNextPageCommentsReducer(QuestionEntityState prev,AddNextPageQuestionCommentsAction action)
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
  TypedReducer<QuestionEntityState,GetNextPageQuestionLikesAction>(getNextPageLikesReducer).call,
  TypedReducer<QuestionEntityState,AddNextPageQuestionLikesAction>(addNextPageLikesReducer).call,

  //
  TypedReducer<QuestionEntityState,MarkQuestionSolutionAsCorrectAction>(markSolutionAsCorrectReducer).call,
  TypedReducer<QuestionEntityState,MarkQuestionSolutionAsIncorrectAction>(markSolutionAsIncorrectReducer).call,
  
  //solutions
  TypedReducer<QuestionEntityState,GetNextPageQuestionSolutionsAction>(getNextPageSolutionsReducer).call,
  TypedReducer<QuestionEntityState,AddNextPageQuestionSolutionsAction>(addNextPageSolutionsReducer).call,
  TypedReducer<QuestionEntityState,CreateNewQuestionSolutionAction>(createNewSolutionReducer).call,
  TypedReducer<QuestionEntityState,CreateNewQuestionVideoSolutionAction>(createNewVideoSolutionReducer).call,
  TypedReducer<QuestionEntityState,AddNewQuestionSolutionAction>(addNewSolutionReducer).call,
  TypedReducer<QuestionEntityState,RemoveQuestionSolutionAction>(removeSolutionReducer).call,
  //correct solutions
  TypedReducer<QuestionEntityState,GetNextPageQuestionCorrectSolutionsAction>(getNextPageCorrectSolutionsReducer).call,
  TypedReducer<QuestionEntityState,AddNextPageQuestionCorrectSolutionsAction>(addNextPageCorrectSolutionsReducer).call,
  //pending solutions
  TypedReducer<QuestionEntityState,GetNextPageQuestionPendingSolutionsAction>(getNextPagePendingSolutionsReducer).call,
  TypedReducer<QuestionEntityState,AddNextPageQuestionPendingSolutionsAction>(addNextPagePendingSolutionsReducer).call,
  //Incorrect solutions
  TypedReducer<QuestionEntityState,GetNextPageQuestionIncorrectSolutionsAction>(getNextPageIncorrectSolutionsReducer).call,
  TypedReducer<QuestionEntityState,AddNextPageQuestionIncorrectSolutionsAction>(addNextPageIncorrectSolutionsReducer).call,
  
  //video solutions
  TypedReducer<QuestionEntityState,GetNextPageQuestionVideoSolutionsAction>(getNextPageVideoSolutionsReducer).call,
  TypedReducer<QuestionEntityState,AddNextPageQuestionVideoSolutionsAction>(addNextPageVideoSolutionReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionVideoSolutionAction>(addVideoSolutionReducer).call,
  TypedReducer<QuestionEntityState,RemoveQuestionVideoSolutionAction>(removeVideoSolutionReducer).call,

  //comments
  TypedReducer<QuestionEntityState,GetNextPageQuestionCommentsAction>(getNextPageCommentsReducer).call,
  TypedReducer<QuestionEntityState,AddNextPageQuestionCommentsAction>(addNextPageCommentsReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionCommentAction>(addCommentReducer).call,
  TypedReducer<QuestionEntityState,RemoveQuestionCommentAction>(removeCommentReducer).call,
  TypedReducer<QuestionEntityState,AddNewQuestionCommentAction>(addNewCommentReducer).call,

  //images
  TypedReducer<QuestionEntityState,LoadQuestionImageAction>(startLoadingImageReducer).call,
  TypedReducer<QuestionEntityState,LoadQuestionImageSuccessAction>(loadImageReducer).call,
  
  TypedReducer<QuestionEntityState,SaveQuestionSuccessAction>(saveReducer).call,
  TypedReducer<QuestionEntityState,UnsaveQuestionSuccessAction>(unsaveReducer).call
]);
