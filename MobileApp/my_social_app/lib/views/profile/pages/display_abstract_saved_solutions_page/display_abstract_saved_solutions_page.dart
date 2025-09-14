// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:my_social_app/l10n/app_localizations.dart';
// import 'package:my_social_app/state/solutions_state/actions.dart';
// import 'package:my_social_app/state/solutions_state/selectors.dart';
// import 'package:my_social_app/state/solutions_state/solution_user_save_state.dart';
// import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
// import 'package:my_social_app/state/state.dart';
// import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
// import 'package:my_social_app/views/profile/pages/display_saved_solutions_page/display_saved_solutions_page.dart';
// import 'package:my_social_app/views/shared/app_back_button_widget.dart';
// import 'package:my_social_app/views/shared/app_title.dart';
// import 'package:my_social_app/views/solution/widgets/no_solutions.dart';
// import 'package:my_social_app/views/solution/widgets/solution_user_save_abstract_items.dart';

// class DisplayAbstractSavedSolutionsPage extends StatelessWidget {
  
//   const DisplayAbstractSavedSolutionsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: (){
//         final store = StoreProvider.of<AppState>(context, listen: false);
//         refreshEntities(store, selectSavedSolutions(store), const RefreshSavedSolutionsAction());
//         return store.onChange.map((state) => selectSavedSolutionsFromState(state.solutions)).firstWhere((e) => !e.loadingNext);
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           leading: const AppBackButtonWidget(),
//           title: AppTitle(
//             title: AppLocalizations.of(context)!.display_abstract_saved_solutions_page_title,
//           ),
//         ),
//         body: StoreConnector<AppState,Pagination<int, SolutionUserSaveState>>(
//           onInit: (store) => getNextEntitiesIfNoPage(store, selectSavedSolutions(store), const NextSavedSolutionsAction()),
//           converter: (store) => selectSavedSolutions(store),
//           builder: (context,pagination) => SolutionUserSaveAbstractItems(
//             noItems: NoSolutions(text: AppLocalizations.of(context)!.display_abstract_saved_solutions_page_no_solutions_content),
//             pagination: pagination,
//             onTap: (solutionId) =>
//               Navigator
//                 .of(context)
//                 .push(MaterialPageRoute(builder: (context) => DisplaySavedSolutionsPage(solutionId: solutionId))),
//             onScrollBottom: (){
//               final store = StoreProvider.of<AppState>(context,listen: false);
//               getNextPageIfReady(store, selectSavedSolutions(store), const NextSavedSolutionsAction());
//             },
//           ),
//         )
//       ),
//     );
//   }
// }