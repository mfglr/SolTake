import 'package:my_social_app/services/purchase_services/in_app_purchace_service.dart';
import 'package:my_social_app/state/app_state/product_details_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void getProductDetailsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is GetProductDetailsAction){
    InAppPurchaseService
      .getProducts()
      .then((products) => store.dispatch(GetProductDetailsSuccessAction(productDetails: products)));
  }
  next(action);
}