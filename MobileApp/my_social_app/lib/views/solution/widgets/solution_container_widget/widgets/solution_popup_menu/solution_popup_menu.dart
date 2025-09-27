import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/utilities/dialog_creator/dialog_creator.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/widgets/solution_popup_menu/solution_actions.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/widgets/solution_popup_menu/solutions_popup_menu_constants.dart';

class SolutionPopupMenu extends StatelessWidget {
  final SolutionState solution;
  const SolutionPopupMenu({
    super.key,
    required this.solution
  });

  void _delete(BuildContext context) =>
    DialogCreator
      .showAppDialog(
        context,
        titleDelete[getLanguage(context)]!,
        contentDelete[getLanguage(context)]!,
        delete[getLanguage(context)]!,
        Icons.delete,
        Colors.red
      )
      .then((response){
        if(response && context.mounted){
          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(DeleteSolutionAction(solution: solution));
        }
      });

    void _reload(BuildContext context) =>
      DialogCreator
      .showAppDialog(
        context,
        titleReload[getLanguage(context)]!,
        contentReload[getLanguage(context)]!,
        reload[getLanguage(context)]!,
        Icons.replay_outlined,
        Colors.black
      )
      .then((response){
        if(response && context.mounted){
          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(LoadSolutionAction(solutionId: solution.id));
        }
      });
    

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SolutionActions>(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onSelected: (value) {
        switch(value){
          case SolutionActions.delete:
            _delete(context);
          case SolutionActions.reload:
            _reload(context);
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
                  delete[getLanguage(context)]!,
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
          ),
          PopupMenuItem<SolutionActions>(
            value: SolutionActions.reload,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  reload[getLanguage(context)]!,
                  style: const TextStyle(
                    color: Colors.black
                  ),
                ),
                const Icon(
                  Icons.replay_outlined,
                  color: Colors.black,
                )
              ],
            )
          )
        ];
      }
    );
  }
}