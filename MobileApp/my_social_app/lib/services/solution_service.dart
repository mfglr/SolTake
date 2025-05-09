import 'dart:async';
import 'dart:convert';
import 'package:app_file/app_file.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/solution_endpoints.dart';
import 'package:my_social_app/models/solution.dart';
import 'package:my_social_app/models/solution_user_save.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/page.dart';

class SolutionService{
  final AppClient _appClient;

  const SolutionService._(this._appClient);
  static final SolutionService _singleton = SolutionService._(AppClient());
  factory SolutionService() => _singleton;

  Future<MultipartRequest> _createSolutionRequest(num questionId, String? content, Iterable<AppFile> medias) async {
    MultipartRequest multiPartRequest = MultipartRequest(
      "POST",
      _appClient.generateUri("$solutionController/$createSolutionEndpoint")
    );
    multiPartRequest.fields["questionId"] = questionId.toString();
    if(content != null) multiPartRequest.fields["content"] = content;
    for(final media in medias){
      var file = await MultipartFile.fromPath("images",media.file.path,contentType: MediaType.parse(media.contentType));
      multiPartRequest.files.add(file);
    }
    return multiPartRequest;
  }
  Future<Solution> create(num questionId, String? content, Iterable<AppFile> medias, void Function(double) callback) async {
    var request = await _createSolutionRequest(questionId,content,medias);
    var data = await _appClient.postStream(request, callback);
    return Solution.fromJson(jsonDecode(data));
  }

  Future<Solution> createByAI(int modelId, int questionId,String? blobName,double? duration,String? prompt,bool isHighResulation)
    => _appClient
        .post(
          "$solutionController/$createSolutionByAiEndpoint",
          body: {
            'modelId': modelId,
            'questionId': questionId,
            'blobName': blobName,
            'duration': duration,
            'prompt': prompt,
            'isHighResulation': isHighResulation
          }
        )
        .then((json) => Solution.fromJson(json));

  Future<void> delete(num solutionId) => 
    _appClient.delete("$solutionController/$deleteSolutionEndpoint/$solutionId");
 
  Future<void> markAsCorrect(num solutionId) =>
    _appClient
      .put(
        "$solutionController/$markSolutionAsCorrectEndpoint",
        body: { "solutionId":solutionId }
      );

  Future<void> markAsIncorrect(num solutionId) =>
    _appClient
      .put(
        "$solutionController/$markSolutionAsIncorrectEndpoint",
        body: { "solutionId":solutionId }
      );
  
  Future<Solution> getSolutionById(num solutionId) =>
    _appClient
      .get("$solutionController/$getSolutionByIdEndpoint/$solutionId")
      .then((response) => Solution.fromJson(response)); 

  Future<Iterable<Solution>> getSolutionsByQuestionId(num questionId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$solutionController/$getSolutionsByQuestionIdEndpoint/$questionId",page))
      .then((response) => response as List)
      .then((list) => list.map((json) => Solution.fromJson(json)));

  Future<Iterable<Solution>> getCorrectSolutionsByQuestionId(num questionId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$solutionController/$getCorrectSolutionsByQuestionIdEndpoint/$questionId",page))
      .then((response) => response as List)
      .then((list) => list.map((json) => Solution.fromJson(json)));

  Future<Iterable<Solution>> getPendingSolutionsByQuestionId(num questionId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$solutionController/$getPendingSolutionsByQuestionIdEndpoint/$questionId",page))
      .then((response) => response as List)
      .then((list) => list.map((json) => Solution.fromJson(json)));

  Future<Iterable<Solution>> getIncorrectSolutionsByQuestionId(num questionId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$solutionController/$getIncorrectSolutionsByQuestionIdEndpoint/$questionId",page))
      .then((response) => response as List)
      .then((list) => list.map((json) => Solution.fromJson(json)));

    Future<Iterable<Solution>> getVideoSolutions(num questionId, Page page) =>
      _appClient
        .get(_appClient.generatePaginationUrl("$solutionController/$getVideoSolutionsEndpoint/$questionId",page))
        .then((response) => response as List)
        .then((list) => list.map((json) => Solution.fromJson(json)));

  Future<Iterable<SolutionUserSave>> getSavedSolutions(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$solutionController/$getSavedSolutionsEndpoint", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => SolutionUserSave.fromJson(e)));
}