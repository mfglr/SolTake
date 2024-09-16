class QuestionUserSaveState{
  final int id;
  final DateTime createdAt;
  final int questionId;
  final int appUserId;

  const QuestionUserSaveState({
    required this.id,
    required this.createdAt,
    required this.questionId,
    required this.appUserId
  });

}