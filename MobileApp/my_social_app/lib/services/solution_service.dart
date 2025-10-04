import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/solution_endpoints.dart';
import 'package:my_social_app/custom_packages/media/models/local_media.dart';
import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/models/solution.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/custom_packages/entity_state/page.dart';

class SolutionService{
  final AppClient _appClient;

  const SolutionService._(this._appClient);
  static final SolutionService _singleton = SolutionService._(AppClient());
  factory SolutionService() => _singleton;

  Future<MultipartRequest> _createSolutionRequest(int questionId, String? content, Iterable<LocalMedia> medias) async {
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
  Future<IdResponse> create(int questionId, String? content, Iterable<LocalMedia> medias, void Function(double) callback) async {
    var request = await _createSolutionRequest(questionId,content,medias);
    var data = await _appClient.postStream(request, callback);
    return IdResponse.fromJson(jsonDecode(data));
  }


  MultipartRequest _createAISolutionRequest(int modelId, int questionId, Uint8List? bytes, String? prompt) {
    MultipartRequest multiPartRequest = MultipartRequest(
      "POST",
      _appClient.generateUri("$solutionController/CreateByAI")
    );
    multiPartRequest.fields["questionId"] = questionId.toString();
    if(prompt != null) multiPartRequest.fields["prompt"] = prompt;
    if(bytes != null){
      var file = MultipartFile.fromBytes("file", bytes, contentType: MediaType.parse("image"));
      multiPartRequest.files.add(file);
    }
    return multiPartRequest;
  }
  Future<Solution> createByAI(int modelId, int questionId, Uint8List? bytes, String? prompt, void Function(double) callback)
    => _appClient
        .postStream(
          _createAISolutionRequest(modelId,questionId, bytes, prompt),
          callback
        )
        .then((json) => Solution.fromJson(json));

  Future<void> delete(int solutionId) => 
    _appClient.delete("$solutionController/$deleteSolutionEndpoint/$solutionId");
 
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
}