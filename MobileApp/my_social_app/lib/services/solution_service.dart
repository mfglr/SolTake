import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/solution_endpoints.dart';
import 'package:my_social_app/models/solution.dart';
import 'package:my_social_app/services/app_client.dart';

class SolutionService{
  final AppClient _appClient;

  const SolutionService._(this._appClient);
  static final SolutionService _singleton = SolutionService._(AppClient());
  factory SolutionService() => _singleton;


  Future<Solution> createAsync(String? content,int questionId, Iterable<XFile>? images) async {
    MultipartRequest request = MultipartRequest(
      "POST",
      _appClient.generateUri("$solutionController/$createSolutionEndpoint")
    );

    if(images != null){
      for(final image in images){
        request.files.add(await MultipartFile.fromPath("images",image.path));
      }
    }
    request.fields["questionId"] = questionId.toString();
    if(content != null) request.fields["content"] = content;
    final response = await _appClient.send(request);
    final json = jsonDecode(utf8.decode(await response.stream.toBytes()));
    
    return Solution.fromJson(json);
  }

  Future<Solution> getSolutionById(int solutionId)
    => _appClient
        .get("$solutionController/$getSolutionByIdEndpoint/$solutionId")
        .then((response) => Solution.fromJson(response)); 

  Future<Iterable<Solution>> getByQuestionId(int questionId,int? lastValue,int? take) async {
    String endPoint = "$solutionController/$getSolutionsByQuestionIdEndpoint/$questionId";
    String url = _appClient.generatePaginationUrl(endPoint, lastValue, take);

    final list = (await _appClient.get(url)) as List;
    return list.map((e) => Solution.fromJson(e));
  }

  Future<Uint8List> getImage(int solutionId,String blobName) async {
    String endPoint = "$solutionController/$getSolutionImageEndPoint/$solutionId/$blobName";
    return await _appClient.getBytes(endPoint);
  }

  Future<void> makeUpvote(int solutionId) async {
    await _appClient.put(
      "$solutionController/$makeUpvoteEndpoint",
      body: {'solutionId': solutionId}
    );
  }

  Future<void> makeDownvote(int solutionId) async {
    await _appClient.put(
      "$solutionController/$makeDownvoteEndpoint",
      body: {'solutionId': solutionId}
    );
  }

  Future<void> removeUpvote(int solutionId) async {
    await _appClient.put(
      "$solutionController/$removeUpvoteEndpoint",
      body: { 'solutionId': solutionId }
    );
  }

  Future<void> removeDownvote(int solutionId) async {
    await _appClient.put(
      "$solutionController/$removeDownvoteEndpoint",
      body: { 'solutionId': solutionId }
    );
  }
}