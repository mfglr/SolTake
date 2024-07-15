import 'package:flutter/material.dart';

@immutable
class BackendException{
  final String message;

  const BackendException({required this.message});

}