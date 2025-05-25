import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/entity_state/entity.dart';

class MessageConnectionState extends Entity<int> implements Avatar{
  final DateTime? lastSeenAt;
  final String userName;
  final Multimedia? image;
  final int state;
  final int? userId;

  MessageConnectionState({
    required super.id,
    required this.lastSeenAt,
    required this.userName,
    required this.image,
    required this.state,
    required this.userId
  });

  MessageConnectionState changeState(int state,int? userId) =>
    MessageConnectionState(
      id: id,
      lastSeenAt: lastSeenAt,
      image: image,
      userName: userName,
      state: state,
      userId: userId
    );
    
    @override
    Multimedia? get avatar => image;
  
    @override
    int get avatarId => id;
  
}