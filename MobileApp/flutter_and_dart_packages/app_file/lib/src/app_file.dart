import 'package:app_file/src/app_file_types.dart';
import 'package:cross_file/cross_file.dart';

class AppFile {

  static const String _noExtention = "NoEx";
  final XFile file;
  final String type;
  const AppFile._({required this.file, required this.type});

  String _extention(){
    var list = file.name.split(".");
    return list.length > 1 ? list.last : _noExtention;
  }

  String get contentType => "$type/${_extention()}";

  factory AppFile.image(XFile file) => AppFile._(file: file, type: AppFileTypes.image);
  factory AppFile.video(XFile file) => AppFile._(file: file, type: AppFileTypes.video);
  factory AppFile.audio(XFile file) => AppFile._(file: file, type: AppFileTypes.audio);
}
