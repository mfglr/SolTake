import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity.dart';

@immutable
class ExamRequestState extends Entity<int>{
  late final DateTime createdAt;
  late final String name;
  late final String initialism;
  late final int state;
  late final int? reason;
  
  static String _toUpperFirst(String value) => "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";

  ExamRequestState(int id,this.createdAt, String name, String initialism, this.state, this.reason) : super(id: id){
    this.name = name.trim().replaceAll(RegExp(r'\s+'), ' ').split(' ').map(_toUpperFirst).join(' ');
    this.initialism = initialism.trim().toUpperCase();
  }
}