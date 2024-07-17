import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/question_endpoints.dart';
import 'package:my_social_app/models/question.dart';
import 'package:my_social_app/services/app_client.dart';

class QuestionService{
  final AppClient _appClient;

  const QuestionService._(this._appClient);
  static final QuestionService _singleton = QuestionService._(AppClient());
  factory QuestionService() => _singleton;

  Future<Question> createQuestion(List<XFile> images,int examId,int subjectId,List<int> topicIds,String? content) async {
    MultipartRequest request = MultipartRequest(
      "POST",
      _appClient.generateUri("$questionController/$createQuestioinEndpoint")
    );
    for(final image in images){
      request.files.add(await MultipartFile.fromPath("images",image.path));
    }
    request.fields["topicIds"] = topicIds.join(',');
    request.fields["examId"] = examId.toString();
    request.fields["subjectId"] = subjectId.toString();
    if(content != null) request.fields["content"] = content;
    
    final response = await _appClient.send(request);
    final json = jsonDecode(utf8.decode(await response.stream.toBytes()));
    return Question.fromJson(json);
  }

  Future<void> like(int questionId) async{
    await _appClient.put(
      "$questionController/$likeQuestionEndpoint",
      body: {
        "QuestionId": questionId
      }
    );
  }
  Future<void> dislike(int questionId) async{
    await _appClient.put(
      "$questionController/$dislikeQuestionEndpoint",
      body: {
        "QuestionId": questionId
      }
    );
  }


  Future<Uint8List> getQuestionImage(int questionId,String blobName) async {
    return await _appClient.getBytes("$questionController/$getQuestionImageEndPoint/$questionId/$blobName");
  }

  Future<List<Question>> getByUserId(int userId,{int? lasId}) async {
    final list = (await _appClient.get("$questionController/$getQuestionsByUserIdEndpoint/$userId")) as List;
    return list.map((e) => Question.fromJson(e)).toList();
  }
  Future<List<Question>> getByTopicId(int topicId,{int? lastId}) async {
    final list = (await _appClient.get("$questionController/$getQuestionsByTopicIdEndpoint/$topicId")) as List;
    return list.map((e) => Question.fromJson(e)).toList();
  }
  Future<List<Question>> getBySubjectId(int subjectId,{int? lastId}) async {
    final list = (await _appClient.get("$questionController/$getQuestionsBySubjectIdEndpoint/$subjectId")) as List;
    return list.map((e) => Question.fromJson(e)).toList();
  }
  Future<List<Question>> getByExamId(int examId,{int? lastId}) async {
    final list = (await _appClient.get("$questionController/$getQuestionsByExamIdEndpoint/$examId")) as List;
    return list.map((e) => Question.fromJson(e)).toList();
  }
}