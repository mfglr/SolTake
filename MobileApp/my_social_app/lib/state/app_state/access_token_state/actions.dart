import 'package:my_social_app/state/app_state/actions.dart';

class ChangeAccessTokenAction extends AppAction{
  final String? accessToken;
  const ChangeAccessTokenAction({required this.accessToken});
}