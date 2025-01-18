class QuestionUserSaveState{
  final int id;
  final DateTime createdAt;
  final int questionId;
  final int userId;

  const QuestionUserSaveState({
    required this.id,
    required this.createdAt,
    required this.questionId,
    required this.userId
  });

}