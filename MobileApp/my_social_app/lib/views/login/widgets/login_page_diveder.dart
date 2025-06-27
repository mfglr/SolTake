import 'package:flutter/material.dart';
import 'package:my_social_app/l10n/app_localizations.dart';

class LoginPageDiveder extends StatelessWidget {
  const LoginPageDiveder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 2,
            height: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: Text(AppLocalizations.of(context)!.login_page_diveder_or),
        ),
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}