import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';

@immutable
class Searchuser{
  final int id;
  final String userName;
  final String? name;
  final Multimedia? image;

  const Searchuser({
    required this.id,
    required this.userName,
    required this.name,
    required this.image
  });
}