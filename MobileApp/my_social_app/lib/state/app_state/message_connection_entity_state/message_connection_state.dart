import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

class MessageConnectionState extends BaseEntity<int> implements Avatar{
  final DateTime? updatedAt;
  final String userName;
  final Multimedia? image;
  final int state;
  final int? typingId;

  MessageConnectionState({
    required super.id,
    required this.updatedAt,
    required this.userName,
    required this.image,
    required this.state,
    required this.typingId
  });

  MessageConnectionState changeState(int state,int? typingId) =>
    MessageConnectionState(
      id: id,
      updatedAt: updatedAt,
      image: image,
      userName: userName,
      state: state,
      typingId: typingId
    );
    
    @override
    Multimedia? get avatar => image;
  
    @override
    int get avatarId => id;
  
}