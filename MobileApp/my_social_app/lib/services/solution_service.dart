import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/solution_endpoints.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/models/solution.dart';
import 'package:my_social_app/models/solution_user_save.dart';
import 'package:my_social_app/models/solution_user_vote.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/pagination/page.dart';

class SolutionService{
  final AppClient _appClient;

  const SolutionService._(this._appClient);
  static final SolutionService _singleton = SolutionService._(AppClient());
  factory SolutionService() => _singleton;

  Future<MultipartRequest> _createSolutionRequest(String? content,int questionId, Iterable<XFile>? images) async {
    MultipartRequest request = MultipartRequest(
      "POST",
      _appClient.generateUri("$solutionController/$createSolutionEndpoint")
    );
    request.headers.addAll(_appClient.getHeader());
    if(images != null){
      for(final image in images){
        request.files.add(await MultipartFile.fromPath("images",image.path));
      }
    }
    request.fields["questionId"] = questionId.toString();
    if(content != null) request.fields["content"] = content;
    return request;
  }
  Future<Solution> create(String? content,int questionId, Iterable<XFile>? images) =>
    _createSolutionRequest(content, questionId, images)
      .then((request) => request.send())
      .then((response) async {
        if(response.statusCode >= 400){
          if(response.statusCode == 401){
            return await _appClient
              .loginByRefreshToken()
              .then((_) => _createSolutionRequest(content, questionId, images))
              .then((request) => request.send());
          }
          var message = utf8.decode(await response.stream.toBytes());
          throw BackendException(message: message, statusCode: response.statusCode);
        }
        return response;
      })
      .then(
        (response) => response.stream
          .toBytes()
          .then((bytes) => utf8.decode(bytes))
          .then((data){
            if(response.statusCode > 400){
              throw BackendException(message: data,statusCode: response.statusCode);
            }
            return Solution.fromJson(jsonDecode(data));
          })
      );


  Future<MultipartRequest> _createVideoSolutionRequest(int questionId, String? content, XFile video) async{
    MultipartRequest request = MultipartRequest(
      "POST",
      _appClient.generateUri("$solutionController/$createVideoSolutionEndpoint")
    );
    request.headers.addAll(_appClient.getHeader());
    if(content != null) request.fields["content"] = content;
    request.files.add(await MultipartFile.fromPath("file",video.path));
    request.fields["questionId"] = questionId.toString();
    return request;
  }

  Future<Solution> createVideoSolution(int questionId, String? content, XFile video) =>
    _createVideoSolutionRequest(questionId, content, video)
      .then((request) => request.send())
      .then((response) async {
        if(response.statusCode >= 400){
          if(response.statusCode == 401){
            return await _appClient
              .loginByRefreshToken()
              .then((_) => _createVideoSolutionRequest(questionId, content, video))
              .then((request) => request.send());
          }
          var message = utf8.decode(await response.stream.toBytes());
          throw BackendException(message: message, statusCode: response.statusCode);
        }
        return response;
      })
      .then(
        (response) => response.stream
          .toBytes()
          .then((bytes) => utf8.decode(bytes))
          .then((data){
            if(response.statusCode > 400){
              throw BackendException(message: data,statusCode: response.statusCode);
            }
            return Solution.fromJson(jsonDecode(data));
          })
      );

  Future<void> delete(int solutionId) => 
    _appClient.delete("$solutionController/$deleteSolutionEndpoint/$solutionId");

  Future<Iterable<SolutionUserVote>> getSolutionUpvotes(int solutionId,Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$solutionController/$getSolutionUpvotesEndpoint/$solutionId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => SolutionUserVote.fromJson(e)));
  
  Future<SolutionUserVote> makeUpvote(int solutionId) =>
    _appClient
      .post(
        "$solutionController/$makeUpvoteEndpoint",
        body: {'solutionId': solutionId}
      )
      .then((json) => SolutionUserVote.fromJson(json));

  Future<void> removeUpvote(int solutionId) =>
    _appClient
      .delete("$solutionController/$removeUpvoteEndpoint/$solutionId");

  
  Future<Iterable<SolutionUserVote>> getSolutionDownvotes(int solutionId,Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$solutionController/$getSolutionDownvotesEndpoint/$solutionId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => SolutionUserVote.fromJson(e)));

  Future<SolutionUserVote> makeDownvote(int solutionId) =>
    _appClient
      .post(
        "$solutionController/$makeDownvoteEndpoint",
        body: {'solutionId': solutionId}
      )
      .then((json) => SolutionUserVote.fromJson(json));

  Future<void> removeDownvote(int solutionId) =>
    _appClient
      .delete("$solutionController/$removeDownvoteEndpoint/$solutionId");

  Future<void> markAsCorrect(int solutionId) =>
    _appClient
      .put(
        "$solutionController/$markSolutionAsCorrectEndpoint",
        body: { "solutionId":solutionId }
      );

  Future<void> markAsIncorrect(int solutionId) =>
    _appClient
      .put(
        "$solutionController/$markSolutionAsIncorrectEndpoint",
        body: { "solutionId":solutionId }
      );

  Future<SolutionUserSave> saveSolution(int solutionId) =>
    _appClient
      .post(
        "$solutionController/$saveSolutionEndpoint",
        body: { "solutionId":solutionId }
      )
      .then((json) => SolutionUserSave.fromJson(json));

  Future<void> unsaveSolution(int solutionId) =>
    _appClient
      .delete("$solutionController/$unsaveSolutionEndpoint/$solutionId");

  Future<Solution> getSolutionById(int solutionId) =>
    _appClient
      .get("$solutionController/$getSolutionByIdEndpoint/$solutionId")
      .then((response) => Solution.fromJson(response)); 

  Future<Iterable<Solution>> getSolutionsByQuestionId(int questionId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$solutionController/$getSolutionsByQuestionIdEndpoint/$questionId",page))
      .then((response) => response as List)
      .then((list) => list.map((json) => Solution.fromJson(json)));

  Future<Iterable<Solution>> getCorrectSolutionsByQuestionId(int questionId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$solutionController/$getCorrectSolutionsByQuestionIdEndpoint/$questionId",page))
      .then((response) => response as List)
      .then((list) => list.map((json) => Solution.fromJson(json)));

  Future<Iterable<Solution>> getPendingSolutionsByQuestionId(int questionId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$solutionController/$getPendingSolutionsByQuestionIdEndpoint/$questionId",page))
      .then((response) => response as List)
      .then((list) => list.map((json) => Solution.fromJson(json)));

  Future<Iterable<Solution>> getIncorrectSolutionsByQuestionId(int questionId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$solutionController/$getIncorrectSolutionsByQuestionIdEndpoint/$questionId",page))
      .then((response) => response as List)
      .then((list) => list.map((json) => Solution.fromJson(json)));

    Future<Iterable<Solution>> getVideoSolutions(int questionId, Page page) =>
      _appClient
        .get(_appClient.generatePaginationUrl("$solutionController/$getVideoSolutionsEndpoint/$questionId",page))
        .then((response) => response as List)
        .then((list) => list.map((json) => Solution.fromJson(json)));

  Future<Iterable<SolutionUserSave>> getSavedSolutions(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$solutionController/$getSavedSolutionsEndpoint", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => SolutionUserSave.fromJson(e)));

  Future<Uint8List> getSolutionImage(int solutionId,int solutionImageId) =>
    _appClient
      .getBytes("$solutionController/$getSolutionImageEndPoint/$solutionId/$solutionImageId");
  
  Future<Uint8List> getSolutionVideo(int solutionId) =>
    _appClient
      .getBytes("$solutionController/$getSolutionVideoEndpoint/$solutionId");

}