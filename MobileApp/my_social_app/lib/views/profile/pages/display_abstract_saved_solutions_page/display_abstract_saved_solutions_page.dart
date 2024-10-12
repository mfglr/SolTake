import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/actionDispathcers.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/profile/pages/display_saved_solutions_page/display_saved_solutions_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
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
      body: StoreConnector<AppState,UserState?>(
        onInit: (store) => store.dispatch(LoadUserAction(userId: store.state.accountState!.id)),
        converter: (store) => store.state.currentUser,
        builder: (context,user){
          if(user == null) return const LoadingWidget();
          return StoreConnector<AppState,Iterable<SolutionState>>(
            onInit: (store) => getNextPageIfNoPage(store,user.savedSolutions,NextUserSavedSolutionsAction(userId: user.id)),
            converter: (store) => store.state.selectUserSavedSolutions(store.state.accountState!.id),
            builder: (context,solutions) => SolutionAbstractItems(
              noItems: NoSolutions(text: AppLocalizations.of(context)!.display_abstract_saved_solutions_page_no_solutions_content),
              solutions: solutions,
              pagination: user.savedSolutions,
              onTap: (solutionId) => 
                Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (context) => DisplaySavedSolutionsPage(solutionId: solutionId))),
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                getNextPageIfReady(store, user.savedSolutions, NextUserSavedSolutionsAction(userId: user.id));
              },
            ),
          );
        }
      ),
    );
  }
}