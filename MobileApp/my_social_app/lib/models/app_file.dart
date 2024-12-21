import 'package:camera/camera.dart';

class AppFile {
  final XFile file;
  final String type;
  const AppFile({required this.file, required this.type});

  factory AppFile.image(XFile file) => AppFile(file: file, type: AppFileTypes.image);
  factory AppFile.video(XFile file) => AppFile(file: file, type: AppFileTypes.video);
  factory AppFile.audio(XFile file) => AppFile(file: file, type: AppFileTypes.audio);
}

abstract class AppFileTypes{
  static const String video = "video";
  static const String image = "image";
  static const String audio = "audio";
}