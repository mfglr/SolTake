import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'purchase.g.dart';

@immutable
@JsonSerializable()
class Purchase {
  final String token;
  final String productId;

  const Purchase({
    required this.token,
    required this.productId
  });
 
  factory Purchase.fromJson(Map<String, dynamic> json) => _$PurchaseFromJson(json);
  Map<String, dynamic> toJson() => _$PurchaseToJson(this);
}