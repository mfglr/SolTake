import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

@immutable
class TransactionState extends BaseEntity<int>{
  final DateTime createdAt;
  final int balanceId;
  final int numberOfInputToken;
  final int numberOfOutputToken;
  final int solPerInputToken;
  final int solPerOutputToken;
  final String aiModelName;
  final Multimedia aiModelImage;

  int get input => numberOfInputToken * solPerInputToken;
  int get output => numberOfOutputToken * solPerOutputToken;
  int get sol => input + output; 

  TransactionState({
    required super.id, 
    required this.createdAt,
    required this.balanceId,
    required this.numberOfInputToken,
    required this.numberOfOutputToken,
    required this.solPerInputToken,
    required this.solPerOutputToken,
    required this.aiModelName,
    required this.aiModelImage
  });
}