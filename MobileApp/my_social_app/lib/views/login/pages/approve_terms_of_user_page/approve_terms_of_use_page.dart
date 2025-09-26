import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/login_state/actions.dart';
import 'package:my_social_app/state/policy_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:my_social_app/views/login/pages/approve_terms_of_user_page/approve_terms_of_user_page_constants.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_circle_widget.dart';

class ApproveTermsOfUsePage extends StatefulWidget {
  const ApproveTermsOfUsePage({super.key});

  @override
  State<ApproveTermsOfUsePage> createState() => _ApproveTermsOfUsePageState();
}

class _ApproveTermsOfUsePageState extends State<ApproveTermsOfUsePage> {
  bool? _isApproved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top:MediaQuery.of(context).size.height / 20),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.aprove_terms_of_use_page_title,
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
                      onChanged: (bool? newValue) {
                        setState(() { _isApproved = newValue; });
                      },
                    ),
                    OutlinedButton(
                      onPressed: (){
                        setState(() => _isApproved = true);
                        final store = StoreProvider.of<AppState>(context,listen: false);
                        store.dispatch(const ApproveTermsOfUseAction());
                      },
                      child: LanguageWidget(
                        child: (language) => Text(
                          checkBoxContent[language]!
                        ),
                      )
                    ),
                  ],
                ),
                StoreConnector<AppState,String?>(
                  onInit: (store) => store.dispatch(LoadTermsOfUseAction(language: store.state.login.login!.language)),
                  converter: (store) => store.state.selectTermsOfUse,
                  builder: (context,termsOfUse){
                    if(termsOfUse == null) return const LoadingCircleWidget();
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: HtmlWidget(termsOfUse),
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