import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/utilities/dialog_creator/dialog_creator.dart';

enum SolutionActions{
  delete,
}

class SolutionPopupMenu extends StatelessWidget {
  final SolutionState solution;
  const SolutionPopupMenu({
    super.key,
    required this.solution
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SolutionActions>(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onSelected: (value) async {
        switch(value){
          case SolutionActions.delete:
            bool response = await DialogCreator.showAppDialog(
              context,
              AppLocalizations.of(context)!.solution_popup_menu_titte,
              AppLocalizations.of(context)!.solution_popup_menu_content,
              AppLocalizations.of(context)!.show_app_dialog_delete_button,
              Icons.delete,
              Colors.red
            );
            if(response && context.mounted){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(DeleteSolutionAction(solution: solution));
            }
            return;
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem<SolutionActions>(
            value: SolutionActions.delete,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.solution_popup_menu_delete_button,
                  style: const TextStyle(
                    color: Colors.red
                  ),
                ),
                const Icon(
                  Icons.delete,
                  color: Colors.red,
                )
              ],
            )
          )
        ];
      }
    );
  }
}