import 'package:flutter/widgets.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class ProductDetailsAction extends AppAction{
  const ProductDetailsAction();
}

@immutable
class GetProductDetailsAction extends ProductDetailsAction{
  const GetProductDetailsAction();
}
@immutable
class GetProductDetailsSuccessAction extends ProductDetailsAction{
  final Iterable<ProductDetails> productDetails;
  const GetProductDetailsSuccessAction({required this.productDetails});
}