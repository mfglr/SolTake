import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/question_user_likes_state/question_user_like_state.dart';
import 'package:my_social_app/state/question_user_likes_state/selectors.dart';
import 'package:my_social_app/packages/entity_state/map_extentions.dart';
import 'package:my_social_app/packages/entity_state/pagination.dart';

class QuestionUserLikesState {
  final Map<int,Pagination<int, QuestionUserLikeState>> likes;

  const QuestionUserLikesState({required this.likes});

  //questions
  QuestionUserLikesState deleteQuestion(QuestionState question) =>
    QuestionUserLikesState(
      likes: likes.removeOne(question.id)
    );
  //questions

  QuestionUserLikesState like(int questionId, QuestionUserLikeState questionUserLike) =>
    QuestionUserLikesState(
      likes: likes.setOne(
        questionId,
        selectQuestionUserLikesFromState(this, questionId).addOne(questionUserLike)
      )
    );

  QuestionUserLikesState dislike(int questionId, int userId) =>
    QuestionUserLikesState(
      likes: likes.setOne(
        questionId,
        selectQuestionUserLikesFromState(this, questionId).where((e) => e.userId != userId)
      )
    );

  QuestionUserLikesState startNext(int questionId) =>
    QuestionUserLikesState(
      likes: likes.setOne(
        questionId,
        selectQuestionUserLikesFromState(this, questionId).startLoadingNext()
      )
    );
  QuestionUserLikesState addNext(int questionId, Iterable<QuestionUserLikeState> questionUserLikes) =>
    QuestionUserLikesState(
      likes: likes.setOne(
        questionId,
        selectQuestionUserLikesFromState(this, questionId).addNextPage(questionUserLikes)
      )
    );
  QuestionUserLikesState refresh(int questionId, Iterable<QuestionUserLikeState> questionUserLikes) =>
    QuestionUserLikesState(
      likes: likes.setOne(
        questionId,
        selectQuestionUserLikesFromState(this, questionId).refreshPage(questionUserLikes)
      )
    );
  QuestionUserLikesState stopNext(int questionId) =>
    QuestionUserLikesState(
      likes: likes.setOne(
        questionId,
        selectQuestionUserLikesFromState(this, questionId).stopLoadingNext()
      )
    );
}