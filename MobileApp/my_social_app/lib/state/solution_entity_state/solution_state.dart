class SolutionState{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int questionId;
  final int appUserId;
  final String userName;
  final String content;
  final int state;
  final int numberOfUpvotes;
  final int numberOfDownvotes;
  final bool isOwner;
  final Iterable<int> solutionImages;

  const SolutionState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.questionId,
    required this.appUserId,
    required this.userName,
    required this.content,
    required this.state,
    required this.numberOfUpvotes,
    required this.numberOfDownvotes,
    required this.isOwner,
    required this.solutionImages
  });
}