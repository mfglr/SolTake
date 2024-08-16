import 'package:my_social_app/state/app_state/create_question_state/actions.dart';
import 'package:my_social_app/state/app_state/create_question_state/create_question_state.dart';
import 'package:redux/redux.dart';

CreateQuestionState addImageReducer(CreateQuestionState prev, CreateQuestionImageAction action)
  => prev.addImage(action.image);
CreateQuestionState addImagesReducer(CreateQuestionState prev, CreateQuestionImagesAction action)
  => prev.addImages(action.images);
CreateQuestionState removeImageReducer(CreateQuestionState prev, RemoveQuestionImageAction action)
  => prev.removeImage(action.image);
CreateQuestionState updateContentReducer(CreateQuestionState prev, UpdateContentAction action)
  => prev.updateContent(action.content);
CreateQuestionState updateExamReducer(CreateQuestionState prev, UpdateExamAction action)
  => prev.updateExam(action.examId);
CreateQuestionState updateSubjectReducer(CreateQuestionState prev,UpdateSubjectAction action)
  => prev.updateSubject(action.subjectId);
CreateQuestionState updateTopicIdsReducer(CreateQuestionState prev,UpdateTopicIdsAction action)
  => prev.updateTopicIds(action.topicIds);
CreateQuestionState clearCreateQuestionStateReducer(CreateQuestionState prev,ClearCreateQuestionStateAction action)
  => prev.clear();

Reducer<CreateQuestionState> createQuestionReducers = combineReducers<CreateQuestionState>([
  TypedReducer<CreateQuestionState,CreateQuestionImageAction>(addImageReducer).call,
  TypedReducer<CreateQuestionState,CreateQuestionImagesAction>(addImagesReducer).call,
  TypedReducer<CreateQuestionState,RemoveQuestionImageAction>(removeImageReducer).call,
  TypedReducer<CreateQuestionState,UpdateContentAction>(updateContentReducer).call,
  TypedReducer<CreateQuestionState,UpdateExamAction>(updateExamReducer).call,
  TypedReducer<CreateQuestionState,UpdateSubjectAction>(updateSubjectReducer).call,
  TypedReducer<CreateQuestionState,UpdateTopicIdsAction>(updateTopicIdsReducer).call,
  TypedReducer<CreateQuestionState,ClearCreateQuestionStateAction>(clearCreateQuestionStateReducer).call,
]);


