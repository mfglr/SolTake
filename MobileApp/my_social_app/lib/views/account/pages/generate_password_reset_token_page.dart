import 'package:flutter/material.dart';
import 'package:my_social_app/views/account/widgets/generate_password_reset_token_form.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class GeneratePasswordResetTokenPage extends StatelessWidget {
  const GeneratePasswordResetTokenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GeneratePasswordResetTokenForm()
          ]
        )
      ),
    );
  }
}