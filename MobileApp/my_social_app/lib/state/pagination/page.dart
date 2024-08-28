import 'package:flutter/material.dart';

@immutable
class Page{
  final int? offset;
  final int take;
  final bool isDescending;
  
  const Page({
    required this.offset,
    required this.take,
    required this.isDescending
  });
}