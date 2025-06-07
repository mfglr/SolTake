import 'package:my_social_app/models/purchase.dart';
import 'package:my_social_app/services/app_client.dart';

class PurchaseService {
  static const String _controllerName = "Purchases";
  static final AppClient _appClient = AppClient();

  static Future<void> create(Purchase purchase) =>
    _appClient
      .post(
        "$_controllerName/create",
        body: {
          "token": purchase.token,
          "productId": purchase.productId
        }
      );

}