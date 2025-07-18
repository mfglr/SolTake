import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/solution_user_saves_state/actions.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/profile/pages/display_saved_solutions_page/display_saved_solutions_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/solution/widgets/no_solutions.dart';
import 'package:my_social_app/views/solution/widgets/solution_abstract_items.dart';

class DisplayAbstractSavedSolutionsPage extends StatelessWidget {
  
  const DisplayAbstractSavedSolutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(
          title: AppLocalizations.of(context)!.display_abstract_saved_solutions_page_title,
        ),
      ),
      body: StoreConnector<AppState,Pagination>(
        converter: (store) => store.state.solutionUserSaves,
        builder: (context,pagination) => StoreConnector<AppState,Iterable<SolutionState>>(
          onInit: (store) => getNextPageIfNoPage(store, store.state.solutionUserSaves, const NextSolutionUserSavesAction()),
          converter: (store) => store.state.selectSavedSolutions,
          builder: (context,solutions) => SolutionAbstractItems(
            noItems: NoSolutions(text: AppLocalizations.of(context)!.display_abstract_saved_solutions_page_no_solutions_content),
            solutions: solutions,
            pagination: pagination,
            onTap: (solutionId) => 
              Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (context) => DisplaySavedSolutionsPage(solutionId: solutionId))),
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              getNextPageIfReady(store, store.state.solutionUserSaves, const NextSolutionUserSavesAction());
            },
          ),
        ),
      )
    );
  }
}