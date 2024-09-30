import 'package:flutter/material.dart';

@immutable
class BackendException{
  final int statusCode;
  final String message;
  const BackendException({required this.message,required this.statusCode});
}