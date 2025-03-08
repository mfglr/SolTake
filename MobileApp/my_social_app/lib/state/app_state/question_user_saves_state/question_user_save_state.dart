import 'package:my_social_app/state/entity_state/base_entity.dart';

class QuestionUserSaveState extends BaseEntity<int> {
  final int questionId;
  QuestionUserSaveState({
    required super.id,
    required this.questionId
  });
}