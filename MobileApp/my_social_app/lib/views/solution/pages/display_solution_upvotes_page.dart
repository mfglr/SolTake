import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/widgets/follow_icon_button_widget.dart';
import 'package:my_social_app/views/user/widgets/user_items_widget.dart';

class DisplaySolutionUpvotesPage extends StatelessWidget {
  final int solutionId;
  const DisplaySolutionUpvotesPage({
    super.key,
    required this.solutionId
  });

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
            title: const AppTitleWidget(title: "Upvotes"),
          ),
          body: StoreConnector<AppState,Iterable<UserState>>(
            onInit: (store) => store.dispatch(GetNextPageSolutionUpvotesIfNoPageAction(solutionId: solutionId)),
            converter: (store) => store.state.selectSolutionUpvotes(solutionId),
            builder:(context,users) => UserItemsWidget(
              users: users,
              pagination: solution.upvotes,
              rigthButtonBuilder: (user) => StoreConnector<AppState,int>(
                converter: (store) => store.state.accountState!.id,
                builder: (context,accountId){
                  if(accountId == user.id) return const SpaceSavingWidget();
                  return FollowIconButtonWidget(user: user);
                },
              ),
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(GetNextPageSolutionUpvotesIfReadyAction(solutionId: solutionId));
              },
            ),
          ),
        );
      }
    );
  }
}