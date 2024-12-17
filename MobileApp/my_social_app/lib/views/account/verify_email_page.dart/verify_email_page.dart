import 'package:flutter/material.dart';
import 'package:my_social_app/views/account/verify_email_page.dart/widgets/logout_button.dart';
import 'package:my_social_app/views/account/verify_email_page.dart/widgets/send_email_verification_mail_button.dart';
import 'package:my_social_app/views/account/verify_email_page.dart/widgets/verify_email_form.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});
  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  late final TextEditingController _token;

  @override
  void initState() {
    _token = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _token.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: const VerifyEmailForm()
            ),
            
            const SendEmailVerificationMailButton(),
            const LogoutButton()
           
          ],
        ),
      ),
    );
  }
}
