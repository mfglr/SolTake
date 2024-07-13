import 'package:flutter/material.dart';

@immutable
class BackendException{
  final String message;
  final int statusCode;

  const BackendException({required this.message, required this.statusCode});

}