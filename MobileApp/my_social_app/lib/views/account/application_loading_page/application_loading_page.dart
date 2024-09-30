import 'package:flutter/material.dart';

class ApplicationLoadingPage extends StatelessWidget {
  const ApplicationLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo-bgremoved.png",
          height: MediaQuery.of(context).size.width / 2,
          width: MediaQuery.of(context).size.width / 2,
        )
      ),
    );
  }
}