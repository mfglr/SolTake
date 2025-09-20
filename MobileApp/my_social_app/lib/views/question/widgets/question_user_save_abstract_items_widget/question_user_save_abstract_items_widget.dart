// import 'package:flutter/material.dart';
// import 'package:my_social_app/helpers/on_scroll_bottom.dart';
// import 'package:my_social_app/services/get_language.dart';
// import 'package:my_social_app/state/questions_state/question_user_save_state.dart';
// import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
// import 'package:my_social_app/views/question/widgets/no_questions_widget/no_questions_widget.dart';
// import 'package:my_social_app/views/question/widgets/question_user_save_abstract_item.dart';
// import 'package:my_social_app/views/shared/loading_circle_widget.dart';
// import 'question_user_save_abstract_items_widget_constants.dart';

// class QuestionUserSaveAbstractItemsWidget extends StatefulWidget {
//   final Pagination<int, QuestionUserSaveState> pagination;
//   final void Function() onScrollBottom;
//   final void Function(int questionId) onTap;
//   final String? noQuestionsContent;

//   const QuestionUserSaveAbstractItemsWidget({
//     super.key,
//     required this.pagination,
//     required this.onScrollBottom,
//     required this.onTap,
//     this.noQuestionsContent
//   });


//   @override
//   State<QuestionUserSaveAbstractItemsWidget> createState() => _QuestionUserSaveAbstractItemsWidgetState();
// }

// class _QuestionUserSaveAbstractItemsWidgetState extends State<QuestionUserSaveAbstractItemsWidget> {
//   final ScrollController _scrollController = ScrollController();
//   late final void Function() _onScrollBottom;
  

//   @override
//   void initState() {
//     _onScrollBottom = () => onScrollBottom(_scrollController,widget.onScrollBottom);
//     _scrollController.addListener(_onScrollBottom);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_onScrollBottom);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         if(widget.pagination.isEmpty)
//           Expanded(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 NoQuestionsWidget(
//                   content: widget.noQuestionsContent ?? content[getLanguage(context)]!,
//                 )
//               ]
//             )
//           )
//         else
//           Expanded(
//             child: GridView.builder(
//               controller: _scrollController,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: widget.pagination.values.length,
//               itemBuilder: (context,index) => QuestionUserSaveAbstractItem(
//                 key: ValueKey(widget.pagination.values.elementAt(index).id),
//                 questionUserSave: widget.pagination.values.elementAt(index),
//                 onTap: widget.onTap,
//               )
//             ),
//           ),
//         if(widget.pagination.loadingNext)
//           const LoadingCircleWidget(strokeWidth: 3)
//       ],
//     );
//   }
// }