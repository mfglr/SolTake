import 'package:my_social_app/state/entity_state/entity.dart';

class QuestionUserSaveState extends Entity<int> {
  final int questionId;
  QuestionUserSaveState({
    required super.id,
    required this.questionId
  });
}