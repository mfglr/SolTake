import 'package:in_app_purchase/in_app_purchase.dart';

class InAppPurchaseService{
  static const _productId = {"fc0a8f3d95904ac1a18b73985cb29031"};
  static final InAppPurchase _inAppPurchase = InAppPurchase.instance;

  static Future<ProductDetails> getProduct()
    => _inAppPurchase
        .queryProductDetails(_productId)
        .then((e) => e.productDetails.first);

  static Future<bool> buy(ProductDetails product)
    => _inAppPurchase
      .buyConsumable(purchaseParam: PurchaseParam(productDetails: product));

  static void consumePurchases(){
    _inAppPurchase.purchaseStream.listen((purchases){
      for(var purchase in purchases){
        if(purchase.status == PurchaseStatus.purchased){
          
          purchase.verificationData.serverVerificationData
        }
      }
    });
  }
}