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

  factory Page.init(int take,bool isDescending) => Page(offset: 2147483647, take: take, isDescending: isDescending);
}