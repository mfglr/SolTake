import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/solution/widgets/solution_item_widget.dart';

class DisplaySolutionPage extends StatelessWidget {
  final int solutionId;
  const DisplaySolutionPage({super.key,required this.solutionId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,SolutionState?>(
      onInit: (store) => store.dispatch(LoadSolutionAction(solutionId: solutionId)),
      converter: (store) => store.state.solutionEntityState.entities[solutionId],
      builder: (context,solution){
        if(solution == null) return const LoadingView();
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: const Text(
              "New solution for your question.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          body: SolutionItemWidget(solution: solution),
        );
      },
    );
  }
}