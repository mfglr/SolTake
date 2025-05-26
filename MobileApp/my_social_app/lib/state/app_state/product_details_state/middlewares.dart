import 'package:my_social_app/services/in_app_purchace_service.dart';
import 'package:my_social_app/state/app_state/product_details_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void getProductDetailsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is GetProductDetailsAction){
    InAppPurchaseService
      .getProduct()
      .then((product) => store.dispatch(GetProductDetailsSuccessAction(productDetails: [product])));
  }
  next(action);
}