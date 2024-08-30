import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class NotFoundPage extends StatelessWidget {
  final String message;
  const NotFoundPage({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("404"),
          Text(message)
        ],
      ),
    );
  }
}