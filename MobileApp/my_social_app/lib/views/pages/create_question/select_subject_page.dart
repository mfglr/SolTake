import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class SelectSubjectPage extends StatelessWidget {
  const SelectSubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
    );
  }
}