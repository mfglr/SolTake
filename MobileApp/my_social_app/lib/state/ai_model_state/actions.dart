import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/ai_model_state/ai_model_state.dart';

@immutable
class AIModelAction extends AppAction{
  const AIModelAction();
}

@immutable
class GetAllAIModelsAction extends AIModelAction{
  const GetAllAIModelsAction();
}
@immutable
class GetAllAIModelsSuccessAction extends AIModelAction{
  final Iterable<AIModelState> aiModels;
  const GetAllAIModelsSuccessAction({required this.aiModels});
}
@immutable
class GetAllAIModelsFailedAction extends AIModelAction{
  const GetAllAIModelsFailedAction();
}