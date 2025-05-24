import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/policy_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

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
                        setState(() { _isApproved = value; });
                      },
                    ),
                    Text(AppLocalizations.of(context)!.aprove_privacy_policy_page_checkbox_label),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: (){
            if(_isApproved != true){
              ToastCreator.displayError(AppLocalizations.of(context)!.approve_policy_page_eror);
              return;
            }
            final store = StoreProvider.of<AppState>(context,listen: false);
            store.dispatch(const ApprovePrivacyPolicyAction());
          },
          child: Text(AppLocalizations.of(context)!.approve_policy_page_button_content)
        ),
      ),
    );
  }
}