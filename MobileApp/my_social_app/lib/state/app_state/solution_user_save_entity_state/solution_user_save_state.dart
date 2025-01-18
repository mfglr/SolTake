class SolutionUserSaveState{
  final int id;
  final DateTime createdAt;
  final int solutionId;
  final int userId;

  const SolutionUserSaveState({
    required this.id,
    required this.createdAt,
    required this.solutionId,
    required this.userId
  });
}