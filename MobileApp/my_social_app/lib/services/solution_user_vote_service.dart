import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/models/solution_user_vote.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/pagination_state/page.dart';

class SolutionUserVoteService {
  static const _controllerName = "SolutionUserVotes";
  final AppClient _appClient;

  const SolutionUserVoteService._(this._appClient);
  static final SolutionUserVoteService _singleton = SolutionUserVoteService._(AppClient());
  factory SolutionUserVoteService() => _singleton;

  Future<IdResponse> makeUpvote(int solutionId) =>
    _appClient
      .post("$_controllerName/makeUpvote", body: { 'solutionId': solutionId })
      .then((json) => IdResponse.fromJson(json));
  
  Future<IdResponse> makeDownvote(int solutionId) =>
    _appClient
      .post("$_controllerName/makeDownvote", body: { "solutionId" : solutionId } )
      .then((json) => IdResponse.fromJson(json));

  Future removeUpvote(int solutionId) =>
    _appClient
      .delete("$_controllerName/removeUpvote/$solutionId");

  Future removeDownvote(int solutionId) =>
    _appClient
      .delete("$_controllerName/removeDownvote/$solutionId");

  Future<Iterable<SolutionUserVote>> getUpvotes(int solutionId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$_controllerName/getUpvotes/$solutionId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => SolutionUserVote.fromJson(e)));

  Future<Iterable<SolutionUserVote>> getDownvotes(int solutionId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$_controllerName/getDownvotes/$solutionId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => SolutionUserVote.fromJson(e)));
}