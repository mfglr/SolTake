import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/app_version_service.dart';
import 'package:my_social_app/services/package_version_service.dart';
import 'package:my_social_app/state/app_state/login_state/login.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/app_login_by_refresh_token_view.dart';
import 'package:my_social_app/views/login/pages/application_loading_page.dart';
import 'package:my_social_app/views/update_app_page/update_app_page.dart';

class AppUpdateView extends StatefulWidget {
  const AppUpdateView({super.key});

  @override
  State<AppUpdateView> createState() => _AppUpdateViewState();
}

class _AppUpdateViewState extends State<AppUpdateView> {
  late final Future<bool> _isUpgradeRequired;

  @override
  void initState() {
    super.initState();
     _isUpgradeRequired = PackageVersionService()
      .getVersion()
      .then((version) => AppVersionService().isUpgradeRequired(version));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isUpgradeRequired,
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.data == null) return const ApplicationLoadingPage();
          if(snapshot.data!) return const UpdateAppPage();
          return StoreConnector<AppState, Login>(
            converter: (store) => store.state.login,
            builder: (context, login) => const AppLoginByRefreshTokenView(),
          );
        }
        return const ApplicationLoadingPage();
      }
    );
  }
}