class MessageState{
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isOwner;
  final bool isEdited;
  final int conversationId;
  final int ownerId;
  final String? content;
  final int state;
  final Iterable<int> images;

  const MessageState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isOwner,
    required this.isEdited,
    required this.conversationId,
    required this.ownerId,
    required this.content,
    required this.state,
    required this.images
  });
}