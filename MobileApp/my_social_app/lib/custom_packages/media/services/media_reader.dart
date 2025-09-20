import 'package:photo_manager/photo_manager.dart';

class MediaReader {
  static Future<List<AssetPathEntity>> getAssetPathEnties() async {
    var request = await PhotoManager.requestPermissionExtend();
    if(!request.isAuth){
      throw "hata";
    }
    return PhotoManager
      .getAssetPathList(
        type: RequestType.fromTypes([RequestType.image, RequestType.video]),
      );
  }
}