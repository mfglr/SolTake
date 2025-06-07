import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_social_app/models/purchase.dart';

class PurchaseStorage {
  static const String _key = "purchases";
  static Iterable<Purchase> _purchases = [];
  static const _storage = FlutterSecureStorage();
  
  static Future<Iterable<Purchase>> init() =>
    _storage
      .read(key: _key)
      .then(
        (values) =>
          values != null
            ? List<Purchase>.from((jsonDecode(values) as Iterable).map((json) => Purchase.fromJson(json)))
            : const Iterable<Purchase>.empty()
      )
      .then((purchases) => _purchases = purchases);

  static Future<void> add(Purchase purchase){
    var newList = [..._purchases, purchase];
    return _storage
      .write(key: _key, value: jsonEncode(newList))
      .then((_) => _purchases = newList);
  }
  
  static Future<void> remove(String token){
    var newList = _purchases.where((e) => e.token != token).toList();
    return _storage
      .write(key: _key, value: jsonEncode(newList))
      .then((_) => _purchases = newList);
  }
}