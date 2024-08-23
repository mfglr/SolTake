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

  Future<Question> createQuestion(Iterable<XFile> images,int examId,int subjectId,Iterable<int> topicIds,String? content) async {
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

  Future<Question> getById(int questionId) async
    => Question.fromJson(await _appClient.get("$questionController/$getQuestionByIdEndpoint/$questionId"));
  Future<Uint8List> getQuestionImage(int questionId,int questionImageId) async {
    return await _appClient.getBytes("$questionController/$getQuestionImageEndPoint/$questionId/$questionImageId");
  }

  Future<Iterable<Question>> getHomePageQuestions(int? offset, int take, bool isDescending) async {
    String endPoint = "$questionController/$getHomePageQuestionsEndpoint";
    String url = _appClient.generatePaginationUrl(endPoint, offset, take,isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((e) => Question.fromJson(e));
  }
  Future<Iterable<Question>> getByUserId(int userId, int? offset, int take, bool isDescending) async {
    String endPoint = "$questionController/$getQuestionsByUserIdEndpoint/$userId";
    String url = _appClient.generatePaginationUrl(endPoint, offset, take, isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((e) => Question.fromJson(e));
  }
  Future<Iterable<Question>> getByTopicId(int topicId, int? offset, int take, bool isDescending) async {
    String endPoint = "$questionController/$getQuestionsByTopicIdEndpoint/$topicId";
    String url = _appClient.generatePaginationUrl(endPoint, offset, take, isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((e) => Question.fromJson(e));
  }
  Future<Iterable<Question>> getBySubjectId(int subjectId, int? offset, int take, bool isDescending) async {
    final endpoint = "$questionController/$getQuestionsBySubjectIdEndpoint/$subjectId";
    final url = _appClient.generatePaginationUrl(endpoint, offset, take, isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((e) => Question.fromJson(e));
  }
  Future<Iterable<Question>> getByExamId(int examId, int? offset, int take, bool isDescending) async {
    String endpoint = "$questionController/$getQuestionsByExamIdEndpoint/$examId";
    final url = _appClient.generatePaginationUrl(endpoint, offset, take, isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((e) => Question.fromJson(e));
  }
  Future<Iterable<Question>> getSolvedQuestionsByUserId(int userId, int? offset, int take, bool isDescending) async {
    String endpoint = "$questionController/$getSolvedQuestionsByUserIdEndpoint/$userId";
    final url = _appClient.generatePaginationUrl(endpoint, offset, take, isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((e) => Question.fromJson(e));
  }
  Future<Iterable<Question>> getUnsolvedQuestionsByUserId(int userId, int? offset, int take, bool isDescending) async {
    String endpoint = "$questionController/$getUnsolvedQuestionsByUserIdEndpoint/$userId";
    final url = _appClient.generatePaginationUrl(endpoint, offset, take, isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((e) => Question.fromJson(e));
  }
  Future<Iterable<Question>> searchQuestions(String? key,int? examId,int? subjectId,int? topicId,int? offset,int take,bool isDescending) async {
    String endpoint = "$questionController/$searchQuestionsEndpoint";
    final body = {
      'key': key == "" ? null : key,
      'examId': examId,
      'subjectId': subjectId,
      'topicId': topicId,
      'offset': offset,
      'take': take,
      'isDescending': isDescending,
    };
    final list = (await _appClient.post(endpoint,body: body)) as List;
    return list.map((e) => Question.fromJson(e));
  }
}