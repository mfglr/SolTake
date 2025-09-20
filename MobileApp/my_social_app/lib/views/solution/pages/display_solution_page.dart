import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/solutions_state/selectors.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_item_widget.dart';

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
    // if(widget.parentId != null){
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     Navigator
    //       .of(context)
    //       .push(
    //         ModalBottomSheetRoute(
    //           builder: (context) => DisplaySolutionCommentsModal(
    //             solution: widget.solutionId,
    //             parentId: widget.parentId,
    //           ), 
    //           isScrollControlled: true
    //         )
    //       );
    //   });
    // }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, EntityContainer<int, SolutionState>>(
      onInit: (store) => 
        loadIfNotLoading(
          store,
          selectSolution(store, widget.solutionId),
          LoadSolutionAction(solutionId: widget.solutionId)
        ),
      converter: (store) => selectSolution(store, widget.solutionId),
      builder: (context, container){
        if(container.isLoadSuccess){
          return Scaffold(
            appBar: AppBar(
              leading: const AppBackButtonWidget(),
              title: AppTitle(title: "${container.entity}${AppLocalizations.of(context)!.display_solutions_page_title}"),
            ),
            body: SolutionItemWidget(solution: container.entity!),
          );
        }
        else{
          return const LoadingCircleWidget();
        }
        
      },
    );
  }
}