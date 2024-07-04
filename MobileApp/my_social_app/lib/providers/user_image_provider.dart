import 'package:flutter/foundation.dart';
import 'package:my_social_app/services/user_service.dart';

class UserImageProvider extends ChangeNotifier{
  final UserService _userService;
  
  UserImageProvider._(this._userService);
  static final UserImageProvider _singleton = UserImageProvider._(UserService());
  factory UserImageProvider() => _singleton;

  final Map<String,Uint8List> _images = {};

  Future<void> loadImage(String id) async {
    if(_images[id] == null){
      final image = await _userService.getImageById(id);
      _images.addEntries([MapEntry(id, image)]);
      notifyListeners();
    }
  }

  Uint8List? getImageById(String id) => _images[id];
}