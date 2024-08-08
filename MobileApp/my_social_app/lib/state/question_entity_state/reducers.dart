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

QuestionEntityState addSolutionReducer(QuestionEntityState prev,AddQuestionSolutionAction action)
  => prev.addSolution(action.questionId,action.solutionId);
QuestionEntityState nextPageQuestionSolutionsReducer(QuestionEntityState prev,NextPageQuestionSolutionsSuccessAction action)
  => prev.nextPageQuestionSolutions(action.questionId, action.solutionIds);

QuestionEntityState getNextPageCommentsReducer(QuestionEntityState prev,GetNextPageQuestionCommentsAction action)
  => prev.getNextPageComments(action.questionId);
QuestionEntityState addNextPageCommentsReducer(QuestionEntityState prev,AddNextPageQuestionCommentsAction action)
  => prev.addNextPageComments(action.questionId, action.commentIds);
QuestionEntityState addCommentReducer(QuestionEntityState prev,AddQuestionCommentAction action)
  => prev.addComment(action.questionId,action.commenId);

Reducer<QuestionEntityState> questionsReducer = combineReducers<QuestionEntityState>([
  TypedReducer<QuestionEntityState,AddQuestionAction>(addQuestionReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionsAction>(addQuestionsReducer).call,
  TypedReducer<QuestionEntityState,LikeQuestionSuccessAction>(likeQuestionSuccessReducer).call,
  TypedReducer<QuestionEntityState,DislikeQuestionSuccessAction>(dislikeQuestionSuccessReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionSolutionAction>(addSolutionReducer).call,
  TypedReducer<QuestionEntityState,NextPageQuestionSolutionsSuccessAction>(nextPageQuestionSolutionsReducer).call,

  TypedReducer<QuestionEntityState,GetNextPageQuestionCommentsAction>(getNextPageCommentsReducer).call,
  TypedReducer<QuestionEntityState,AddNextPageQuestionCommentsAction>(addNextPageCommentsReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionCommentAction>(addCommentReducer).call,
]);
