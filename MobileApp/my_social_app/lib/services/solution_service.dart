import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/solution_endpoints.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/models/solution.dart';
import 'package:my_social_app/models/solution_user_save.dart';
import 'package:my_social_app/models/solution_user_vote.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/state/pagination/page.dart';

class SolutionService{
  final AppClient _appClient;

  const SolutionService._(this._appClient);
  static final SolutionService _singleton = SolutionService._(AppClient());
  factory SolutionService() => _singleton;


  Future<String> _readResponse(HttpClientResponse response) {
    final completer = Completer<String>();
    final contents = StringBuffer();
    response.transform(utf8.decoder).listen((data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));
    return completer.future;
  }


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


  Future<HttpClientRequest> _createVideoSolutionRequest(int questionId, String? content, XFile video,  void Function(double) callback) async {
    MultipartRequest multiPartRequest = MultipartRequest(
      "POST",
      _appClient.generateUri("$solutionController/$createVideoSolutionEndpoint")
    );
    if(content != null) multiPartRequest.fields["content"] = content;
    multiPartRequest.files.add(await MultipartFile.fromPath("file",video.path));
    multiPartRequest.fields["questionId"] = questionId.toString();

    var stream = multiPartRequest.finalize();
    var length = multiPartRequest.contentLength;

    var r = await HttpClient().postUrl(_appClient.generateUri("$solutionController/$createVideoSolutionEndpoint"));
    r.headers.set(HttpHeaders.contentTypeHeader, multiPartRequest.headers[HttpHeaders.contentTypeHeader]!);
    r.headers.set(HttpHeaders.authorizationHeader, "Bearer ${store.state.accessToken}");
    r.headers.set(HttpHeaders.acceptLanguageHeader, store.state.accountState?.language ?? PlatformDispatcher.instance.locale.languageCode);

    var byteCount = 0;
    await r.addStream(
      stream.transform(
        StreamTransformer.fromHandlers(
          handleData: (data,sink){
            sink.add(data);
            byteCount += data.length;
            callback(byteCount / length);
          }
        )  
      )
    );
    return r;
  }

  Future<Solution> createVideoSolution(int questionId, String? content, XFile video, void Function(double) callback) async {
    var request = await _createVideoSolutionRequest(questionId,content,video,callback);
    var response = await request.close();
    var data = await _readResponse(response);
    
    if(response.statusCode > 400){
      if(response.statusCode != 401){
        throw BackendException(message: data,statusCode: response.statusCode);
      }
      await _appClient.loginByRefreshToken();
      request = await _createVideoSolutionRequest(questionId,content,video,callback);
      response = await request.close();
      data = await _readResponse(response);
      if(response.statusCode > 400){
        throw BackendException(message: data,statusCode: response.statusCode);
      }
    }
    return Solution.fromJson(jsonDecode(data));
  }

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