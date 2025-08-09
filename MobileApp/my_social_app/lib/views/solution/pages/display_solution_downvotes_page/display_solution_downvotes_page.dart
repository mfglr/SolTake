import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/selectors.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_user_vote/solution_user_votes_widget.dart';

class DisplaySolutionDownvotesPage extends StatefulWidget {
  final int solutionId;

  const DisplaySolutionDownvotesPage({
    super.key,
    required this.solutionId,
  });

  @override
  State<DisplaySolutionDownvotesPage> createState() => _DisplaySolutionDownvotesPageState();
}

class _DisplaySolutionDownvotesPageState extends State<DisplaySolutionDownvotesPage> {
  final ScrollController _controller = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _controller,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextPageIfReady(
        store,
        selectSolutionDownvotes(store, widget.solutionId),
        NextSolutionDownvotesAction(solutionId: widget.solutionId)
      );
    }
  );

  @override
  void initState() {
    _controller.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrollBottom);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(
          store,
          selectSolutionDownvotes(store, widget.solutionId),
          RefreshSolutionDownvotesAction(solutionId: widget.solutionId)
        );
        return onSolutionDownvotesLoaded(store, widget.solutionId);
      },
      child: StoreConnector<AppState,Pagination<int, SolutionUserVoteState>>(
        onInit: (store) => 
          getNextPageIfNoPage(
            store,
            selectSolutionDownvotes(store, widget.solutionId),
            NextSolutionDownvotesAction(solutionId: widget.solutionId)
          ),
        converter: (store) => selectSolutionDownvotes(store, widget.solutionId),
        builder: (context,pagination) => Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: AppTitle(
              title: AppLocalizations.of(context)!.display_solutions_downvote_page_title
            ),
          ),
          body: SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                SolutionUserVotesWidget(
                  solutionUserVotes: pagination.values
                ),
                if(pagination.loadingNext)
                  const LoadingCircleWidget()
              ],
            ),
          )
        )
      ),
    );
  }
}