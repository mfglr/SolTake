import 'dart:async';
import 'dart:convert';
import 'package:app_file/app_file.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/question_endpoints.dart';
import 'package:my_social_app/models/question.dart';
import 'package:my_social_app/models/question_user_save.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:http_parser/http_parser.dart';

class QuestionService{
  final AppClient _appClient;

  const QuestionService._(this._appClient);
  static final QuestionService _singleton = QuestionService._(AppClient());
  factory QuestionService() => _singleton;

  Future<MultipartRequest> _createQuestionRequest(Iterable<AppFile> medias,int examId,int subjectId,int? topicId,String? content) async{
    MultipartRequest request = MultipartRequest(
      "POST",
      _appClient.generateUri("$questionController/$createQuestioinEndpoint")
    );
    for(final media in medias){
      request.files.add(await MultipartFile.fromPath("medias", media.file.path, contentType: MediaType.parse(media.contentType)));
    }
    if(topicId != null) request.fields["topicId"] = topicId.toString();
    request.fields["examId"] = examId.toString();
    request.fields["subjectId"] = subjectId.toString();
    if(content != null) request.fields["content"] = content;

    return request;
  }

  Future<Question> createQuestion(Iterable<AppFile> medias,int examId,int subjectId,int? topicId,String? content,void Function(double) callback) async {
    var request = await _createQuestionRequest(medias,examId,subjectId,topicId,content);
    var data = await _appClient.postStream(request, callback);
    return Question.fromJson(jsonDecode(data));
  }

  Future<void> delete(int questionId) =>
    _appClient
      .delete("$questionController/$deleteQuestionEndpoint/$questionId");
  
  

  Future<QuestionUserSave> save(num questionId) =>
    _appClient
      .post(
        "$questionController/$saveQuestionEndpoint",
        body: { "QuestionId": questionId }
      )
      .then((json) => QuestionUserSave.fromJson(json));
  
  Future<void> unsave(num questionId) =>
    _appClient
      .delete("$questionController/$unsaveQuestionEndpoint/$questionId");
  
  Future<Question> getById(num questionId) =>
    _appClient
      .get("$questionController/$getQuestionByIdEndpoint/$questionId")
      .then((json) => Question.fromJson(json));
 
  Future<Iterable<Question>> getHomePageQuestions(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$questionController/$getHomePageQuestionsEndpoint",page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Question.fromJson(e)));
  
  Future<Iterable<Question>> getByUserId(int userId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$questionController/$getQuestionsByUserIdEndpoint/$userId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Question.fromJson(e)));
  
  Future<Iterable<Question>> getByTopicId(int topicId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$questionController/$getQuestionsByTopicIdEndpoint/$topicId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Question.fromJson(e)));
  
  Future<Iterable<Question>> getBySubjectId(int subjectId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$questionController/$getQuestionsBySubjectIdEndpoint/$subjectId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Question.fromJson(e)));
  
  Future<Iterable<Question>> getByExamId(int examId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$questionController/$getQuestionsByExamIdEndpoint/$examId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Question.fromJson(e)));

  Future<Iterable<Question>> getSolvedQuestionsByUserId(int userId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$questionController/$getSolvedQuestionsByUserIdEndpoint/$userId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Question.fromJson(e)));

  Future<Iterable<Question>> getUnsolvedQuestionsByUserId(int userId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$questionController/$getUnsolvedQuestionsByUserIdEndpoint/$userId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Question.fromJson(e)));
  
  Future<Iterable<QuestionUserSave>> getSavedQuestions(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$questionController/$getSavedQuestionsEndpoint", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => QuestionUserSave.fromJson(e)));

  Future<Iterable<Question>> getVideoQuestions(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$questionController/$getVideoQuestionsEndpoint", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Question.fromJson(e)));

  Future<Iterable<Question>> searchQuestions(int? examId,int? subjectId,int? topicId,Page page) async {
    String endpoint = "$questionController/$searchQuestionsEndpoint";
    final body = {
      'examId': examId,
      'subjectId': subjectId,
      'topicId': topicId,
      'offset': page.offset,
      'take': page.take,
      'isDescending': page.isDescending,
    };
    final list = (await _appClient.post(endpoint,body: body)) as List;
    return list.map((e) => Question.fromJson(e));
  }
}