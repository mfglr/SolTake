import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/solution_votes_state/actions.dart';
import 'package:my_social_app/state/solution_votes_state/selectors.dart';
import 'package:my_social_app/state/solution_votes_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_circle_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_user_vote/solution_user_votes_widget.dart';

class DisplaySolutionUpvotesPage extends StatefulWidget {
  final int solutionId;

  const DisplaySolutionUpvotesPage({
    super.key,
    required this.solutionId,
  });

  @override
  State<DisplaySolutionUpvotesPage> createState() => _DisplaySolutionUpvotesPageState();
}

class _DisplaySolutionUpvotesPageState extends State<DisplaySolutionUpvotesPage> {
  final ScrollController _controller = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _controller,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextPageIfReady(
        store,
        selectSolutionUpvotes(store, widget.solutionId),
        NextSolutionUpvotesAction(solutionId: widget.solutionId)
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
          selectSolutionUpvotes(store, widget.solutionId),
          RefreshSolutionUpvotesAction(solutionId: widget.solutionId)
        );
        return onSolutionUpvotesLoaded(store, widget.solutionId);
      },
      child: StoreConnector<AppState, Pagination<int, SolutionUserVoteState>>(
        onInit: (store) => 
          getNextPageIfNoPage(
            store,
            selectSolutionUpvotes(store, widget.solutionId),
            NextSolutionUpvotesAction(solutionId: widget.solutionId)
          ),
        converter: (store) => selectSolutionUpvotes(store, widget.solutionId),
        builder: (context, pagination) => Scaffold(
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
                SolutionUserVotesWidget(solutionUserVotes: pagination.values),
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