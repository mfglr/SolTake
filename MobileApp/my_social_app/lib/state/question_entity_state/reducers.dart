import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_entity_state.dart';
import 'package:redux/redux.dart';

QuestionEntityState addQuestionReducer(QuestionEntityState prev,AddQuestionAction action)
  => prev.addQuestion(action.value);
QuestionEntityState addQuestionsReducer(QuestionEntityState prev,AddQuestionsAction action)
  => prev.addQuestions(action.questions);

QuestionEntityState likeQuestionSuccessReducer(QuestionEntityState prev, LikeQuestionSuccessAction action)
  => prev.like(action.questionId);
QuestionEntityState dislikeQuestionSuccessReducer(QuestionEntityState prev, DislikeQuestionSuccessAction action)
  => prev.dislike(action.questionId);

QuestionEntityState getNextPageSolutionsReducer(QuestionEntityState prev,GetNextPageQuestionSolutionsAction action)
  => prev.getNextPageSolutions(action.offset,action.questionId);
QuestionEntityState addNextPageSolutionsReducer(QuestionEntityState prev,AddNextPageQuestionSolutionsAction action)
  => prev.addNextPageSolutions(action.offset,action.questionId, action.solutionIds);
QuestionEntityState addSolutionReducer(QuestionEntityState prev,AddQuestionSolutionAction action)
  => prev.addSolution(action.offset,action.questionId,action.solutionId);
QuestionEntityState addSolutionPaginationReducer(QuestionEntityState prev,AddQuestionSolutionsPaginationSuccessAction action)
  => prev.addSolutionPagination(action.offset,action.questionId);

QuestionEntityState getNextPageCommentsReducer(QuestionEntityState prev,GetNextPageQuestionCommentsAction action)
  => prev.getNextPageComments(action.offset, action.questionId);
QuestionEntityState addNextPageCommentsReducer(QuestionEntityState prev,AddNextPageQuestionCommentsAction action)
  => prev.addNextPageComments(action.offset, action.questionId, action.commentIds);
QuestionEntityState addCommentReducer(QuestionEntityState prev,AddQuestionCommentAction action)
  => prev.addComment(action.offset, action.questionId,action.commenId);
QuestionEntityState addCommentsPaginationReducer(QuestionEntityState prev,AddQuestionCommentsPaginationSuccessAction action)
  => prev.addCommentsPagination(action.offset,action.questionId);

QuestionEntityState startLoadingImageReducer(QuestionEntityState prev,LoadQuestionImageAction action)
  => prev.startLoadingImage(action.questionId, action.index);
QuestionEntityState loadImageReducer(QuestionEntityState prev,LoadQuestionImageSuccessAction action)
  => prev.loadImage(action.questionId, action.index, action.image);

Reducer<QuestionEntityState> questionsReducer = combineReducers<QuestionEntityState>([
  TypedReducer<QuestionEntityState,AddQuestionAction>(addQuestionReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionsAction>(addQuestionsReducer).call,
  TypedReducer<QuestionEntityState,LikeQuestionSuccessAction>(likeQuestionSuccessReducer).call,
  TypedReducer<QuestionEntityState,DislikeQuestionSuccessAction>(dislikeQuestionSuccessReducer).call,
  
  TypedReducer<QuestionEntityState,GetNextPageQuestionSolutionsAction>(getNextPageSolutionsReducer).call,
  TypedReducer<QuestionEntityState,AddNextPageQuestionSolutionsAction>(addNextPageSolutionsReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionSolutionAction>(addSolutionReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionSolutionsPaginationSuccessAction>(addSolutionPaginationReducer).call,

  TypedReducer<QuestionEntityState,GetNextPageQuestionCommentsAction>(getNextPageCommentsReducer).call,
  TypedReducer<QuestionEntityState,AddNextPageQuestionCommentsAction>(addNextPageCommentsReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionCommentAction>(addCommentReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionCommentsPaginationSuccessAction>(addCommentsPaginationReducer).call,

  TypedReducer<QuestionEntityState,LoadQuestionImageAction>(startLoadingImageReducer).call,
  TypedReducer<QuestionEntityState,LoadQuestionImageSuccessAction>(loadImageReducer).call,
]);
