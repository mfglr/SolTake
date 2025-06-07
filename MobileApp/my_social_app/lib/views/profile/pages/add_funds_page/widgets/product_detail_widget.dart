import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:my_social_app/services/purchase_services/in_app_purchace_service.dart';

class ProductDetailWidget extends StatelessWidget {
  final ProductDetails product;
  const ProductDetailWidget({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                product.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
              Text(
                product.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontStyle: FontStyle.italic
                ),
              ),
              Text(
                "${product.price} ${product.currencySymbol}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48
                ),
              ),
              OutlinedButton(
                onPressed: () => InAppPurchaseService.buy(product),
                child: const Text(
                  "Satın Al"
                )
              )
            ],
          ),
        ],
      ),
    );
  }
}