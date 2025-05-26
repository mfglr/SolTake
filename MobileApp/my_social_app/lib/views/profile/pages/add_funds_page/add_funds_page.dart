import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:my_social_app/state/app_state/product_details_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/profile/pages/add_funds_page/widgets/product_detail_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_column.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

import 'add_funds_page_texts.dart';

class AddFundsPage extends StatelessWidget {
  const AddFundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) => AppTitle(
            title: title[language]!
          )
        ),
      ),
      body: StoreConnector<AppState,Iterable<ProductDetails>>(
        onInit: (store) => store.dispatch(const GetProductDetailsAction()),
        converter: (store) => store.state.productDetails,
        builder: (context, products) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppColumn(
            children: products.map((product) => ProductDetailWidget(product: product))
          ),
        )
      ),
    );
  }
}