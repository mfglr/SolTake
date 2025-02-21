import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/question_user_like_endpoints.dart';
import 'package:my_social_app/models/question_user_like.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/pagination/page.dart';

class QuestionUserLikeService {
  final AppClient _appClient;

  const QuestionUserLikeService._(this._appClient);
  static final QuestionUserLikeService _singleton = QuestionUserLikeService._(AppClient());
  factory QuestionUserLikeService() => _singleton;

  Future<QuestionUserLike> like(int questionId) =>
    _appClient
      .post(
        "$questionUserLikeController/$likeEndpoint",
        body: { "QuestionId": questionId }
      )
      .then((json) => QuestionUserLike.fromJson(json));

  Future<void> dislike(int questionId) =>
    _appClient
      .delete("$questionUserLikeController/$dislikeEndpoint/$questionId");

  Future<Iterable<QuestionUserLike>> getQuestionLikes(int questionId,Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$questionUserLikeController/$getQuestionLikesEndpoint/$questionId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => QuestionUserLike.fromJson(e)));
    
}