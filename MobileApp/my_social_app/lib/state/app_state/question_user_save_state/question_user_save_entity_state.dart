import 'package:collection/collection.dart';
import 'package:my_social_app/state/app_state/question_user_save_state/question_user_save_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';

class QuestionUserSaveEntityState extends EntityState<QuestionUserSaveState>{
  const QuestionUserSaveEntityState({required super.entities});

  QuestionUserSaveEntityState addSaves(Iterable<QuestionUserSaveState> saves) =>
    QuestionUserSaveEntityState(entities: appendMany(saves));
  QuestionUserSaveEntityState addSave(QuestionUserSaveState save) =>
    QuestionUserSaveEntityState(entities: appendOne(save));
  QuestionUserSaveEntityState removeSave(int saveId) =>
    QuestionUserSaveEntityState(entities: removeOne(saveId));

  QuestionUserSaveState? select(int questionId, int saverId) =>
    entities.values.firstWhereOrNull((e) => e.questionId == questionId && e.appUserId == saverId);
}