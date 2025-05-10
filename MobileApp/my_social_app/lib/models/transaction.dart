import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/transaction_state/transaction_state.dart';
part 'transaction.g.dart';

@immutable
@JsonSerializable()
class Transaction {
  final int id;
  final DateTime createdAt;
  final int balanceId;
  final int numberOfInputToken;
  final int numberOfOutputToken;
  final int solPerInputToken;
  final int solPerOutputToken;
  final String aiModelName;
  final Multimedia aiModelImage;

  const Transaction({
    required this.id,
    required this.createdAt,
    required this.balanceId,
    required this.numberOfInputToken,
    required this.numberOfOutputToken,
    required this.solPerInputToken,
    required this.solPerOutputToken,
    required this.aiModelName,
    required this.aiModelImage,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);


  TransactionState toState() =>
    TransactionState(
      id: id,
      createdAt: createdAt,
      balanceId: balanceId,
      numberOfInputToken: numberOfInputToken,
      numberOfOutputToken: numberOfOutputToken,
      solPerInputToken: solPerInputToken,
      solPerOutputToken: solPerOutputToken,
      aiModelName: aiModelName,
      aiModelImage: aiModelImage
    );
}