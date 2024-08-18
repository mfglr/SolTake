class NotificationState{
  final int id;
  final int ownerId;
  final DateTime createdAt;
  final bool isViewed;
  final int type;
  final int? parentId;
  final int? commentId;
  final String? content;
  final int? questionId;
  final int userId;
  final String userName;
  final int? solutionId;

  const NotificationState({
    required this.id,
    required this.ownerId,
    required this.createdAt,
    required this.isViewed,
    required this.type,
    required this.parentId,
    required this.commentId,
    required this.content,
    required this.questionId,
    required this.userId,
    required this.userName,
    required this.solutionId,
  });

  NotificationState markAsViewed()
    => NotificationState(
        id: id,
        ownerId: ownerId,
        createdAt: createdAt,
        isViewed: true,
        type: type,
        parentId: parentId,
        commentId: commentId,
        content: content,
        questionId: questionId,
        userId: userId,
        userName: userName,
        solutionId: solutionId
      );
}