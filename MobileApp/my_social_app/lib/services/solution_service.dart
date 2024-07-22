import 'dart:convert';

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
}