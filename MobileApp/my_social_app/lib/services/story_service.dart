import 'package:app_file/app_file.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:my_social_app/models/story.dart';
import 'package:my_social_app/services/app_client.dart';

class StoryService {
  static const _controllerName = "Stories";
  final AppClient _appClient;

  const StoryService._(this._appClient);
  static final StoryService _singleton = StoryService._(AppClient());
  factory StoryService() => _singleton;

  Future<MultipartRequest> _createStoryRequest(Iterable<AppFile> medias) async{
    MultipartRequest request = MultipartRequest(
      "POST",
      _appClient.generateUri("$_controllerName/create")
    );
    for(final media in medias){
      request.files.add(await MultipartFile.fromPath("medias", media.file.path, contentType: MediaType.parse(media.contentType)));
    }
    return request;
  }

  Future<Iterable<Story>> create(Iterable<AppFile> medias) =>
    _createStoryRequest(medias)
      .then((json) => json as Iterable)
      .then((list) => list.map((e) => Story.fromJson(e)));


}