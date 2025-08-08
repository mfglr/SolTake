import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';

@immutable
class LoadQuestionAction extends AppAction{
  final int questionId;
  const LoadQuestionAction({required this.questionId});
}
@immutable
class LoadQuestionSuccessAction extends AppAction{
  final QuestionState question;
  const LoadQuestionSuccessAction({required this.question});
}
@immutable
class LoadQuestionFailedAction extends AppAction{
  final int questionId;
  const LoadQuestionFailedAction({required this.questionId});
}
@immutable
class LoadQuestionNotFoundAction extends AppAction{
  final int questionId;
  const LoadQuestionNotFoundAction({required this.questionId});
}


//questions
@immutable
class DeleteQuestionAction extends AppAction{
  final QuestionState question;
  const DeleteQuestionAction({required this.question});
}
@immutable
class DeleteQuestionSuccessAction extends AppAction{
  final QuestionState question;
  const DeleteQuestionSuccessAction({required this.question});
}
//questions



//question user saves
@immutable
class NextQuestionUserSavesAction extends AppAction{
  const NextQuestionUserSavesAction();
}
@immutable
class NextQuestionUserSavesSuccessAction extends AppAction{
  final Iterable<QuestionUserSaveState> questionUserSaves;
  const NextQuestionUserSavesSuccessAction({required this.questionUserSaves});
}
@immutable
class NextQuestionUserSavesFailedAction extends AppAction{
  const NextQuestionUserSavesFailedAction();
}

@immutable
class RefreshQuestionUserSavesAction extends AppAction{
  const RefreshQuestionUserSavesAction();
}
@immutable
class RefreshQuestionUserSavesSuccessAction extends AppAction{
  final Iterable<QuestionUserSaveState> questionUserSaves;
  const RefreshQuestionUserSavesSuccessAction({required this.questionUserSaves});
}
@immutable
class RefreshQuestionUserSavesFailedAction extends AppAction{
  const RefreshQuestionUserSavesFailedAction();
}

@immutable
class SaveQuestionAction extends AppAction{
  final QuestionState question;
  const SaveQuestionAction({required this.question});
}
@immutable
class SaveQuestionSuccessAction extends AppAction{
  final QuestionUserSaveState questionUserSave;
  const SaveQuestionSuccessAction({required this.questionUserSave});
}

@immutable
class UnsaveQuestionAction extends AppAction{
  final QuestionState question;
  const UnsaveQuestionAction({required this.question});
}
@immutable
class UnsaveQuestionSuccessAction extends AppAction{
  final QuestionState question;
  const UnsaveQuestionSuccessAction({required this.question});
} 
//question user saves

