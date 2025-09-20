import 'package:flutter/material.dart';

@immutable
abstract class BaseContainer<K>{
  final K key;
  const BaseContainer({required this.key});
}