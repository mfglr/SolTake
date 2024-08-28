import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/comment_endpoints.dart';
import 'package:my_social_app/models/comment.dart';
import 'package:my_social_app/models/comment_user_like.dart';
import 'package:my_social_app/models/user.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/pagination/page.dart';

class CommentService{
  final AppClient _appClient;

  const CommentService._(this._appClient);
  static final CommentService _singleton = CommentService._(AppClient());
  factory CommentService() => _singleton;

  Future<Comment> createComment(String content,int? questionId,int? solutionId,int? repliedId) =>
    _appClient
      .post(
        "$commentController/$createCommentEndpoint",
        body: {
          'content': content,
          'questionId': questionId,
          'solutionId': solutionId,
          'repliedId': repliedId
        }
      )
      .then((json) => Comment.fromJson(json));

  Future<void> deleteComment(int commentId) =>
    _appClient.delete("$commentController/$deleteCommentEndpoint/$commentId");

  Future<CommentUserLike> like(int commentId) =>
    _appClient
      .post(
        "$commentController/$likeQuestionCommentEndpoint",
        body: { 'id' : commentId }
      )
      .then((json) => CommentUserLike.fromJson(json));

  Future<void> dislike(int commentId) =>
    _appClient
      .delete("$commentController/$dislikeQuestionCommentEndpoint/$commentId");

  Future<Comment> getById(int id) => 
    _appClient
      .get("$commentController/$getCommentByIdEndpoint/$id")
      .then((json) => Comment.fromJson(json));
    
  Future<Iterable<Comment>> getByIds(Iterable<int> ids) =>
    _appClient
      .get("$commentController/$getCommentsByIdsEndpoint?ids=${ids.join(',')}")
      .then((response) => (response as List))
      .then((list) => list.map((e) => Comment.fromJson(e)));

  Future<Iterable<Comment>> getCommentsByQuestionId(int questionId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$commentController/$getCommentsByQuestionIdEndpoint/$questionId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Comment.fromJson(e)));

  Future<Iterable<Comment>> getBySolutionId(int solutionId, Page page) =>
    _appClient
        .get(_appClient.generatePaginationUrl("$commentController/$getCommentsBySolutionIdEndpoint/$solutionId", page))
        .then((json) => json as List)
        .then((list) => list.map((e) => Comment.fromJson(e)));

  Future<Iterable<Comment>> getByParentId(int parentId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$commentController/$getCommentsByParentIdEndpoint/$parentId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Comment.fromJson(e)));

  Future<Iterable<User>> getCommentLikes(int commentId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$commentController/$getCommentLikesEndpoint/$commentId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => User.fromJson(e)));
}