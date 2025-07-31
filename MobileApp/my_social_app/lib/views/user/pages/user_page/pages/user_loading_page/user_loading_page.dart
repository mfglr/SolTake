import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_loading_page/widgets/user_image_loading_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_loading_page/widgets/user_info_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_loading_page/widgets/user_name_loading_widget.dart';
class UserLoadingPage extends StatelessWidget {
  const UserLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: const Row(
          children: [
            Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserImageLoadingWidget(),
                    UserNameLoadingWidget()
                  ],
                ),
                Expanded(
                  child: UserInfoWidget()
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}