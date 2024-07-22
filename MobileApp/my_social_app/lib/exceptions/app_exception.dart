import 'package:flutter/material.dart';

@immutable
class AppException{
  final String message;
  const AppException({required this.message});
}