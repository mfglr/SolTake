// import 'package:flutter/material.dart';
// import 'package:my_social_app/services/get_language.dart';
// import 'package:my_social_app/state/questions_state/question_user_save_state.dart';
// import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
// import 'package:my_social_app/views/question/widgets/no_questions_widget/no_questions_widget.dart';
// import 'package:my_social_app/views/question/widgets/question_user_save_items_widget/question_user_save_items_widget_constants.dart';
// import 'package:my_social_app/views/shared/loading_circle_widget.dart';

// class QuestionUserSaveItemsWidget extends StatefulWidget {
//   final Pagination<int, QuestionUserSaveState> pagination;
//   final Function onScrollBottom;
//   final int? firstDisplayedQuestionId;
//   final String? noQuestionsContent;

//   const QuestionUserSaveItemsWidget({
//     super.key,
//     required this.pagination,
//     required this.onScrollBottom,
//     this.firstDisplayedQuestionId,
//     this.noQuestionsContent
//   });
 
//   @override
//   State<QuestionUserSaveItemsWidget> createState() => _QuestionUserSaveItemsWidgetState();
// }

// class _QuestionUserSaveItemsWidgetState extends State<QuestionUserSaveItemsWidget> {
//   final ScrollController _scrollController = ScrollController();
//   late final void Function() _onScrollBottom;
//   final GlobalKey _key = GlobalKey();

//   @override
//   void initState() {
//     _onScrollBottom = (){
//       if(_scrollController.hasClients && _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
//         widget.onScrollBottom();
//       }
//     };
//     _scrollController.addListener(_onScrollBottom);
    
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if(_key.currentContext != null){
//         Scrollable.ensureVisible(_key.currentContext!);
//       }
//     });

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
//     return SingleChildScrollView(
//       controller: _scrollController,
//       child: Column(
//         children: [
//           if(widget.pagination.isEmpty)
//             Container(
//               margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   NoQuestionsWidget(
//                     content: widget.noQuestionsContent ?? noQuestionsContent[getLanguage(context)]!
//                   ),
//                 ]
//               ),
//             )
//           else
//             ...List.generate(
//               widget.pagination.values.length,
//               (index) => Container(
//                 key: widget.pagination.values.elementAt(index).id == widget.firstDisplayedQuestionId ? _key : null,
//                 margin: const EdgeInsets.only(bottom: 16),
//                 // child: QuestionItemWidget(question: widget.pagination.values.elementAt(index).toQuestionState())
//               ),
//             ),
//           if(widget.pagination.loadingNext)
//             const LoadingCircleWidget(strokeWidth: 3)
//         ]
//       ),
//     );
//   }
// }