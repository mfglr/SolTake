import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:my_social_app/state/app_state/product_details_state/actions.dart';
import 'package:redux/redux.dart';

Iterable<ProductDetails> getProductDetailsSuccessReducer(Iterable<ProductDetails> prev, GetProductDetailsSuccessAction action)
  => action.productDetails;

Reducer<Iterable<ProductDetails>> productDetailsReducers = combineReducers<Iterable<ProductDetails>>([
  TypedReducer<Iterable<ProductDetails>,GetProductDetailsSuccessAction>(getProductDetailsSuccessReducer).call
]);