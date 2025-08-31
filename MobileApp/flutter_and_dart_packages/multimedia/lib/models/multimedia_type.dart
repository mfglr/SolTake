import 'package:json_annotation/json_annotation.dart';

enum MultimediaType {
  @JsonValue(0)
  image,
  @JsonValue(1)
  video
}