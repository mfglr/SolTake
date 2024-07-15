import 'package:http/http.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/question_endpoints.dart';
import 'package:my_social_app/services/http_service.dart';
import 'package:my_social_app/state/create_question_state/create_question_state.dart';

class QuestionService{
  final HttpService _httpService;

  const QuestionService._(this._httpService);
  static final QuestionService _singleton = QuestionService._(HttpService());
  factory QuestionService() => _singleton;

  Future createQuestion(CreateQuestionState state) async {
    final request =  MultipartRequest("POST", _httpService.generateUri("$questionController/$createQuestioinEndpoint"));
    for(final image in state.images){
      request.files.add(await MultipartFile.fromPath("images",image.path));
    }
    request.fields["topicIds"] = state.topicIds.join(',');
    request.fields["examId"] = state.examId.toString();
    request.fields["subjectId"] = state.subjectId.toString();
    request.fields["content"] = state.content ?? "";
    await _httpService.postFormData(request);
  }
}