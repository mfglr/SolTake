class NotificationState{
  final int id;
  final int ownerId;
  final DateTime createdAt;
  final bool isViewed;
  final int type;
  final int? commentId;
  final int? questionId;
  final int? userId;
  final int? solutionId;

  const NotificationState({
    required this.id,
    required this.ownerId,
    required this.createdAt,
    required this.isViewed,
    required this.type,
    required this.commentId,
    required this.questionId,
    required this.userId,
    required this.solutionId,
  });

  NotificationState markAsViewed()
    => NotificationState(
        id: id,
        ownerId: ownerId,
        createdAt: createdAt,
        isViewed: true,
        type: type,
        commentId: commentId,
        questionId: questionId,
        userId: userId,
        solutionId: solutionId
      );
}