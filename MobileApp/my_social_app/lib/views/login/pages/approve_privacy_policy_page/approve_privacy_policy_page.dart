import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/login_state/actions.dart';
import 'package:my_social_app/state/policy_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:my_social_app/views/login/pages/approve_privacy_policy_page/approve_privacy_policy_page_constants.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_circle_widget.dart';

class ApprovePolicyPage extends StatefulWidget {
  const ApprovePolicyPage({super.key});

  @override
  State<ApprovePolicyPage> createState() => _ApprovePolicyPageState();
}

class _ApprovePolicyPageState extends State<ApprovePolicyPage> {
  bool? _isApproved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.aprove_privacy_policy_page_title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _isApproved,
                      onChanged: (value) {
                        if(value != null && value){
                          final store = StoreProvider.of<AppState>(context,listen: false);
                          store.dispatch(const ApprovePrivacyPolicyAction());
                        }
                      },
                    ),
                    OutlinedButton(
                      onPressed: (){
                        setState(() => _isApproved = true);
                        final store = StoreProvider.of<AppState>(context,listen: false);
                        store.dispatch(const ApprovePrivacyPolicyAction());
                      },
                      child: LanguageWidget(
                        child: (language) => Text(
                          checkBoxContent[language]!,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ),
                  ],
                ),
                StoreConnector<AppState,String?>(
                  onInit: (store) => store.dispatch(LoadPrivacyPolicyAction(language: store.state.login.login!.language)),
                  converter: (store) => store.state.selectPrivacyPolicy,
                  builder: (context,privacyPolicy){
                    if(privacyPolicy == null) return const LoadingCircleWidget();
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: HtmlWidget(privacyPolicy),
                        )
                      ),
                    );
                  }
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}