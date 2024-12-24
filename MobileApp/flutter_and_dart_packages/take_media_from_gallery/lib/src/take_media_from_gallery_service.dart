import 'package:app_file/app_file.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class TakeMediaFromGalleryService {

  static const String _invalidMedia = 'Invalid media';
  
  const TakeMediaFromGalleryService._();
  static const TakeMediaFromGalleryService _singleton = TakeMediaFromGalleryService._();
  factory TakeMediaFromGalleryService() => _singleton;

  Future<Iterable<AppFile>> getMedias() =>
    ImagePicker()
      .pickMultipleMedia()
      .then((medias) => medias.map((e){
        var mimeType = lookupMimeType(e.path);
        if(mimeType == null) throw _invalidMedia;
        
        if(mimeType.startsWith(AppFileTypes.video)){
          return AppFile.video(e);
        }
        else if(mimeType.startsWith(AppFileTypes.image)){
          return AppFile.image(e);
        }
        else{
          throw _invalidMedia;
        }
      }));
}
