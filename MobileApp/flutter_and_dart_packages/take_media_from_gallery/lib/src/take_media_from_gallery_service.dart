import 'package:app_file/app_file.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class TakeMediaFromGalleryService {

  static const String _invalidMedia = 'Invalid media';
  
  const TakeMediaFromGalleryService._();
  static const TakeMediaFromGalleryService _singleton = TakeMediaFromGalleryService._();
  factory TakeMediaFromGalleryService() => _singleton;

  static AppFile _toAppFile(XFile file){
    var mimeType = lookupMimeType(file.path);
    if(mimeType == null) throw _invalidMedia;
    
    if(mimeType.startsWith(AppFileTypes.video)) return AppFile.video(file);
    if(mimeType.startsWith(AppFileTypes.image)) return AppFile.image(file);
    throw _invalidMedia;
  }

  Future<Iterable<AppFile>> getMedias() =>
    ImagePicker()
      .pickMultipleMedia()
      .then((files) => files.map((e) => _toAppFile(e)));

  Future<AppFile?> getImage() =>
    ImagePicker()
      .pickImage(source: ImageSource.gallery)
      .then((file) => file != null ? _toAppFile(file) : null);
}
