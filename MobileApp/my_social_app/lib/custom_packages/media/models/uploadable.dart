import 'package:my_social_app/custom_packages/media/models/multimedia_status.dart';

abstract class Uploadable{
  MultimediaStatus get uploadStatus;
  double get downloadRate;

  Uploadable startUpload();
  Uploadable changeUploadRate(double rate);
  Uploadable completeUpload();
}