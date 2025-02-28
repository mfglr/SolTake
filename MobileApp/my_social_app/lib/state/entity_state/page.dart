import 'package:flutter/material.dart';

@immutable
class Page<K extends Comparable>{
  final K? offset;
  final int take;
  final bool isDescending;
  
  const Page({
    required this.offset,
    required this.take,
    required this.isDescending
  });

  factory Page.init(int take,bool isDescending) => Page(offset: null, take: take, isDescending: isDescending);
}