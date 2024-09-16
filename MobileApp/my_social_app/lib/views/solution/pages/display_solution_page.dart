import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/modals/display_solution_comments_modal.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DisplaySolutionPage extends StatefulWidget {
  final int solutionId;
  final int? parentId;

  const DisplaySolutionPage({
    super.key,
    required this.solutionId,
    this.parentId
  });

  @override
  State<DisplaySolutionPage> createState() => _DisplaySolutionPageState();
}

class _DisplaySolutionPageState extends State<DisplaySolutionPage> {
  @override
  void initState() {
    if(widget.parentId != null){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator
          .of(context)
          .push(
            ModalBottomSheetRoute(
              builder: (context) => DisplaySolutionCommentsModal(
                solutionId: widget.solutionId,
                parentId: widget.parentId,
              ), 
              isScrollControlled: true
            )
          );
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,SolutionState?>(
      onInit: (store) => store.dispatch(LoadSolutionAction(solutionId: widget.solutionId)),
      converter: (store) => store.state.solutionEntityState.entities[widget.solutionId],
      builder: (context,solution){
        if(solution == null) return const LoadingView();
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: AppTitle(title: "${solution.userName}${AppLocalizations.of(context)!.display_solutions_page_title}"),
          ),
          body: SingleChildScrollView(
            child: SolutionItemWidget(
              solution: solution,
            )
          ),
        );
      },
    );
  }
}