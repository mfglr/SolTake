import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/comment_endpoints.dart';
import 'package:my_social_app/models/comment.dart';
import 'package:my_social_app/models/user.dart';
import 'package:my_social_app/services/app_client.dart';

class CommentService{
  final AppClient _appClient;

  const CommentService._(this._appClient);
  static final CommentService _singleton = CommentService._(AppClient());
  factory CommentService() => _singleton;

  Future<Comment> createComment(String content,int? questionId,int? solutionId,int? repliedId) async
    => Comment.fromJson(
        await _appClient.post(
          "$commentController/$createCommentEndpoint",
          body: {
            'content': content,
            'questionId': questionId,
            'solutionId': solutionId,
            'repliedId': repliedId
          }
        )
      );

  Future<void> deleteComment(int commentId)
    => _appClient.delete("$commentController/$deleteCommentEndpoint/$commentId");

  Future<void> like(int questionCommentId) async
    => await _appClient.put(
      "$commentController/$likeQuestionCommentEndpoint",
      body: {
        'id' : questionCommentId
      }
    );

  Future<void> dislike(int questionCommentId) async
    => await _appClient.put(
      "$commentController/$dislikeQuestionCommentEndpoint",
      body: {
        'id' : questionCommentId
      }
    );

  Future<Comment> getById(int id) async
    => Comment.fromJson(
      await _appClient.get(
        "$commentController/$getCommentByIdEndpoint/$id"
      )
    );
    
  Future<Iterable<Comment>> getByIds(Iterable<int> ids) =>
    _appClient
      .get("$commentController/$getCommentsByIdsEndpoint?ids=${ids.join(',')}")
      .then((response) => (response as List))
      .then((list) => list.map((e) => Comment.fromJson(e)));

  Future<Iterable<Comment>> getCommentsByQuestionId(int questionId,int? lastValue, int? take,bool isDescending) async{
    final endPoint = "$commentController/$getCommentsByQuestionIdEndpoint/$questionId";
    final url = _appClient.generatePaginationUrl(endPoint, lastValue, take,isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((e) => Comment.fromJson(e));
  }

   Future<Iterable<Comment>> getBySolutionId(int solutionId,int? lastValue,int? take,bool isDescending) async{
    final endPoint = "$commentController/$getCommentsBySolutionIdEndpoint/$solutionId";
    final url = _appClient.generatePaginationUrl(endPoint, lastValue, take,isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((e) => Comment.fromJson(e));
  }

  Future<Iterable<Comment>> getByParentId(int parentId,int? lastValue, int? take,bool isDescending) async{
    final url = "$commentController/$getCommentsByParentIdEndpoint/$parentId";
    final list = (await _appClient.get(_appClient.generatePaginationUrl(url,lastValue,take,isDescending))) as List;
    return list.map((e) => Comment.fromJson(e));
  }

  Future<Iterable<User>> getCommentLikes(int commentId,int? lastValue,int? take,bool isDescending) async{
    final url = "$commentController/$getCommentLikesEndpoint/$commentId";
    final list = (await _appClient.get(_appClient.generatePaginationUrl(url, lastValue, take, isDescending))) as List;
    return list.map((e) => User.fromJson(e));
  }
}