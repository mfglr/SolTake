import 'package:camera/camera.dart';
import 'package:http_parser/http_parser.dart';

class AppFile {
  final XFile file;
  final String type;
  const AppFile._({required this.file, required this.type});

  String _extention() => file.name.split(".")[1];

  MediaType get contentType => MediaType.parse("$type/${_extention()}");

  factory AppFile.image(XFile file) => AppFile._(file: file, type: AppFileTypes.image);
  factory AppFile.video(XFile file) => AppFile._(file: file, type: AppFileTypes.video);
  factory AppFile.audio(XFile file) => AppFile._(file: file, type: AppFileTypes.audio);
}

abstract class AppFileTypes{
  static const String video = "video";
  static const String image = "image";
  static const String audio = "audio";
}