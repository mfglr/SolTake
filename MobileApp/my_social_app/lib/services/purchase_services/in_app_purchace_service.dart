import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:my_social_app/models/purchase.dart';
import 'package:my_social_app/services/purchase_services/purchase_service.dart';
import 'package:my_social_app/services/purchase_services/purchase_storage.dart';

class InAppPurchaseService{
  static const _productIds = {
    "fc0a8f3d95904ac1a18b73985cb29031",
    "test",
  };
  static final InAppPurchase _inAppPurchase = InAppPurchase.instance;

  static Future<List<ProductDetails>> getProducts()
    => _inAppPurchase
        .queryProductDetails(_productIds)
        .then((e) => e.productDetails);

  static Future<bool> buy(ProductDetails product)
    => _inAppPurchase
        .buyConsumable(purchaseParam: PurchaseParam(productDetails: product));
  

  static void consumePurchases(){
    _inAppPurchase.purchaseStream.listen((purchases){
      for(var purchase in purchases){
        if(purchase.status == PurchaseStatus.purchased){
          var p = Purchase(
            token: purchase.verificationData.serverVerificationData,
            productId: purchase.productID
          );
          PurchaseStorage
            .add(p)
            .then((_) => PurchaseService.create(p))
            .then((_) => PurchaseStorage.remove(p.token));
        }
      }
    });
  }
}