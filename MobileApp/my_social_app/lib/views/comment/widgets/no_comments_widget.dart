import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoCommentsWidget extends StatelessWidget {
  const NoCommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,CreateCommentState>(
      converter: (store) => store.state.createCommentState,
      builder: (context,state) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.no_comments_title,
            style: const TextStyle(fontSize: 40),
            textAlign: TextAlign.center,
          ),
          Text(
            AppLocalizations.of(context)!.no_comments_description,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}