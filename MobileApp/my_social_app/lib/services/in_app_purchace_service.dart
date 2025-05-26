import 'package:in_app_purchase/in_app_purchase.dart';

class InAppPurchaseService{
  static const _productId = {"fc0a8f3d95904ac1a18b73985cb29031"};
  static final InAppPurchase _inAppPurchase = InAppPurchase.instance;

  static Future<ProductDetails> getProduct()
    => _inAppPurchase
        .queryProductDetails(_productId)
        .then((e) => e.productDetails.first);
}