import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
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
      var pagination = store.state.solutionEntityState.getValue(widget.solutionId)!.upvotes;
      getNextPageIfReady(store, pagination, NextSolutionUpvotesAction(solutionId: widget.solutionId));
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
    return StoreConnector<AppState,SolutionState>(
      onInit: (store){
        var pagination = store.state.solutionEntityState.getValue(widget.solutionId)!.upvotes;
        getNextPageIfNoPage(store, pagination, NextSolutionUpvotesAction(solutionId: widget.solutionId)); 
      },
      converter: (store) => store.state.solutionEntityState.getValue(widget.solutionId)!,
      builder: (context,solution) => Scaffold(
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
              SolutionUserVotesWidget(solutionUserVotes: solution.upvotes.values),
              if(solution.downvotes.loadingNext)
                const LoadingCircleWidget()
            ],
          ),
        )
      )
    );
  }
}