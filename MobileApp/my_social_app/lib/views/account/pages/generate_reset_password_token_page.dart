import 'package:flutter/material.dart';
import 'package:my_social_app/views/account/widgets/generate_token_form.dart';

class GenerateResetPasswordTokenPage extends StatelessWidget {
  const GenerateResetPasswordTokenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GenerateTokenForm()
          ],
        ),
      ),
    );
  }
}

