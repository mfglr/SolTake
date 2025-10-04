import 'package:flutter/material.dart';
import 'package:my_social_app/views/login/widgets/reset_password_form.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  final String email;
  const ResetPasswordPage({super.key,required this.email});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResetPasswordForm(email: email)            
          ],
        ),
      ),
    );
  
  }
}