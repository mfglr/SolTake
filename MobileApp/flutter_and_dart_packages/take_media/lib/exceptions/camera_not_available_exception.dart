import 'dart:io';

class CameraNotAvailableException extends StdoutException {
  CameraNotAvailableException() : super("Camera is not available!");
}