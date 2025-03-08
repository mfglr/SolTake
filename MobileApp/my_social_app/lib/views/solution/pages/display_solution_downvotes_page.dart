import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/widgets/follow_icon_button_widget.dart';
import 'package:my_social_app/views/user/widgets/user_items_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DisplaySolutionDownvotesPage extends StatelessWidget {
  final int solutionId;

  const DisplaySolutionDownvotesPage({
    super.key,
    required this.solutionId,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,SolutionState?>(
      onInit: (store) => store.dispatch(LoadSolutionAction(solutionId: solutionId)),
      converter: (store) => store.state.solutionEntityState.getValue(solutionId),
      builder: (context,solution){
        if(solution == null) return const LoadingView();
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: AppTitle(
              title: AppLocalizations.of(context)!.display_solutions_downvote_page_title
            ),
          ),
          body: StoreConnector<AppState,Iterable<UserState>>(
            onInit: (store) => getNextPageIfNoPage(store,solution.downvotes,NextSolutionDownvotesAction(solutionId: solutionId)),
            converter: (store) => store.state.selectSolutionDownvotes(solutionId),
            builder:(context,users) => UserItemsWidget(
              users: users,
              pagination: solution.downvotes,
              rigthButtonBuilder: (user) => StoreConnector<AppState,num>(
                converter: (store) => store.state.loginState!.id,
                builder: (context,accountId){
                  if(accountId == user.id) return const SpaceSavingWidget();
                  return FollowIconButtonWidget(user: user);
                },
              ),
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                getNextPageIfReady(store,solution.downvotes,NextSolutionDownvotesAction(solutionId: solutionId));
              },
            ),
          ),
        );
      }
    );
  }
}