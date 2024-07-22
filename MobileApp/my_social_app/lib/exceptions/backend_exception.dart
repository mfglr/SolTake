import 'package:flutter/material.dart';
import 'package:my_social_app/exceptions/app_exception.dart';

@immutable
class BackendException extends AppException{
  const BackendException({required super.message});
}