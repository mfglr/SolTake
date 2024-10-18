import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/question_endpoints.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/models/question.dart';
import 'package:my_social_app/models/question_user_like.dart';
import 'package:my_social_app/models/question_user_save.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/pagination/page.dart';

class QuestionService{
  final AppClient _appClient;

  const QuestionService._(this._appClient);
  static final QuestionService _singleton = QuestionService._(AppClient());
  factory QuestionService() => _singleton;

  Future<MultipartRequest> _createQuestionRequest(Iterable<XFile> images,int examId,int subjectId,int? topicId,String? content) async{
    MultipartRequest request = MultipartRequest(
      "POST",
      _appClient.generateUri("$questionController/$createQuestioinEndpoint")
    );
    request.headers.addAll(_appClient.getHeader());
    for(final image in images){
      request.files.add(await MultipartFile.fromPath("images",image.path));
    }
    if(topicId != null) request.fields["topicId"] = topicId.toString();
    request.fields["examId"] = examId.toString();
    request.fields["subjectId"] = subjectId.toString();
    if(content != null) request.fields["content"] = content;
    return request;
  }

  Future<Question> createQuestion(Iterable<XFile> images,int examId,int subjectId,int? topicId,String? content) =>
    _createQuestionRequest(images,examId,subjectId,topicId,content)
      .then((request) => request.send())
      .then((response) async {
        if(response.statusCode < 400) return response;
        if(response.statusCode == 401){
          return await _appClient
            .loginByRefreshToken()
            .then((_) => _createQuestionRequest(images, examId, subjectId, topicId, content))
            .then((request) => request.send());
        }
        var message = utf8.decode(await response.stream.toBytes());
        throw BackendException(message: message, statusCode: response.statusCode);
      })
      .then(
        (response) => response.stream
          .toBytes()
          .then((bytes) => utf8.decode(bytes))
          .then((data){
            if(response.statusCode > 400){
              throw BackendException(message: data,statusCode: response.statusCode);
            }
            return Question.fromJson(jsonDecode(data));
          })
      );

  Future<void> delete(int questionId) =>
    _appClient
      .delete("$questionController/$deleteQuestionEndpoint/$questionId");

  Future<QuestionUserLike> like(int questionId) =>
    _appClient
      .post(
        "$questionController/$likeQuestionEndpoint",
        body: { "QuestionId": questionId }
      )
      .then((json) => QuestionUserLike.fromJson(json));
  
  Future<void> dislike(int questionId) =>
    _appClient
      .delete("$questionController/$dislikeQuestionEndpoint/$questionId");

  Future<QuestionUserSave> save(int questionId) =>
    _appClient
      .post(
        "$questionController/$saveQuestionEndpoint",
        body: { "QuestionId": questionId }
      )
      .then((json) => QuestionUserSave.fromJson(json));
  
  Future<void> unsave(int questionId) =>
    _appClient
      .delete("$questionController/$unsaveQuestionEndpoint/$questionId");
  

  Future<Question> getById(int questionId) =>
    _appClient
      .get("$questionController/$getQuestionByIdEndpoint/$questionId")
      .then((json) => Question.fromJson(json));
 
  Future<Uint8List> getQuestionImage(int questionId,int questionImageId) =>
    _appClient
      .getBytes("$questionController/$getQuestionImageEndPoint/$questionId/$questionImageId");

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

  Future<Iterable<QuestionUserLike>> getQuestionLikes(int questionId,Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$questionController/$getQuestionLikesEndpoint/$questionId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => QuestionUserLike.fromJson(e)));
  
  Future<Iterable<QuestionUserSave>> getSavedQuestions(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$questionController/$getSavedQuestionsEndpoint", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => QuestionUserSave.fromJson(e)));


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