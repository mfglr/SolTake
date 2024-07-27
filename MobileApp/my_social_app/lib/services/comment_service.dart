import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/comment_endpoints.dart';
import 'package:my_social_app/models/comment.dart';
import 'package:my_social_app/services/app_client.dart';

class CommentService{
  final AppClient _appClient;

  const CommentService._(this._appClient);
  static final CommentService _singleton = CommentService._(AppClient());
  factory CommentService() => _singleton;

  Future<Comment> createComment(String content,int? questionId,int? solutionId,int? parentId) async
    => Comment.fromJson(
        await _appClient.post(
          "$questionCommentController/$createCommentEndpoint",
          body: {
            'content': content,
            'questionId': questionId,
            'solutionId': solutionId,
            'parentId': parentId
          }
        )
      );

  Future<void> like(int questionCommentId) async
    => await _appClient.put(
      "$questionCommentController/$likeQuestionComment",
      body: {
        'id' : questionCommentId
      }
    );

  Future<void> dislike(int questionCommentId) async
    => await _appClient.put(
      "$questionCommentController/$dislikeQuestionComment",
      body: {
        'id' : questionCommentId
      }
    );

  Future<Iterable<Comment>> getByQuestionId(int questionId,int? lastId) async{
    String endPoint = "$questionCommentController/$getQuestionCommentsByQuestionIdEndpoint/$questionId";
    String url = lastId != null ? "$endPoint?lastId=$lastId" : endPoint;

    final list = (await _appClient.get(url)) as List;
    return list.map((e) => Comment.fromJson(e));
  }

  Future<Iterable<Comment>> getByParentId(int parentId,int? lastId, int? take) async{
    String url = "$questionCommentController/$getCommentsByParentIdEndpoint/$parentId";
    final list = (await _appClient.get(_appClient.generatePaginationUrl(url, lastId, take))) as List;
    return list.map((e) => Comment.fromJson(e));
  }



}