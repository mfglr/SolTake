import 'package:flutter/material.dart';

class AppBackButtonWidget extends StatelessWidget {
  const AppBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Icon(Icons.arrow_back),
    );
  }
}