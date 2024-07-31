class MessageState{
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isEdited;
  final int senderId;
  final int receiverId;
  final String? content;
  final int state;
  final DateTime? receiptedAt;
  final DateTime? viewedAt;
  final Iterable<int> images;

  const MessageState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isEdited,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.state,
    required this.receiptedAt,
    required this.viewedAt,
    required this.images
  });
}