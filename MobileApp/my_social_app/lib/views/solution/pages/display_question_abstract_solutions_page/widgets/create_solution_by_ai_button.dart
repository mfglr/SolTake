import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/solution/pages/create_solution_by_ai_page/create_solution_by_ai_page.dart';

class CreateSolutionByAiButton extends StatelessWidget {
  final int questionId;
  const CreateSolutionByAiButton({
    super.key,
    required this.questionId
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: Text(AppLocalizations.of(context)!.create_solution_by_ai_button_label)
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.blue,
          ),
          child: const FaIcon(FontAwesomeIcons.robot),
          onPressed: () => 
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => CreateSolutionByAiPage(questionId: questionId)))
              .then((model){
                if(model != null && context.mounted){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  store.dispatch(CreateSolutionByAiAction(questionId: questionId, model: model));
                }
              }),
        ),
      ],
    );
  }
}