import 'package:flutter/material.dart';

@immutable
abstract class Entity{
  final int id;
  
  const Entity({required this.id});
}

