import 'package:my_social_app/models/comment_user_like.dart';
import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/custom_packages/entity_state/page.dart';
import 'package:my_social_app/services/app_client.dart';

class CommentUserLikeService {
  static const _controllerName = "commentUserLikes";
  final AppClient _appClient;

  const CommentUserLikeService._(this._appClient);
  static final CommentUserLikeService _singleton = CommentUserLikeService._(AppClient());
  factory CommentUserLikeService() => _singleton;

  Future<IdResponse> create(int commentId) =>
    _appClient
      .post("$_controllerName/create", body: { 'commentId' : commentId })
      .then((json) => IdResponse.fromJson(json));

  Future<void> delete(int commentId) =>
    _appClient
      .delete("$_controllerName/delete/$commentId");

  Future<Iterable<CommentUserLike>> get(int commentId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$_controllerName/get/$commentId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => CommentUserLike.fromJson(e)));
}