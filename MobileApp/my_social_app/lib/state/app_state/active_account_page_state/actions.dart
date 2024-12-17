import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/active_account_page.dart';

class ChangeActiveAccountPageAction extends AppAction{
  final ActiveAccountPage activeAcountPage;
  const ChangeActiveAccountPageAction({required this.activeAcountPage});
}