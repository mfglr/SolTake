import 'package:flutter/material.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/no_question_abstract_items_widget.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_item_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class QuestionAbstractItemsWidget extends StatefulWidget {
  final Iterable<QuestionState> questions;
  final Pagination pagination;
  final Function onScrollBottom;
  final void Function(int questionId)? onTap;

  const QuestionAbstractItemsWidget({
    super.key,
    required this.questions,
    required this.pagination,
    required this.onScrollBottom,
    this.onTap
  });

  @override
  State<QuestionAbstractItemsWidget> createState() => _QuestionAbstractItemsWidgetState();
}

class _QuestionAbstractItemsWidgetState extends State<QuestionAbstractItemsWidget> {
  final ScrollController _scrollController = ScrollController();
  late final void Function() _onScrollBottom;
  

  @override
  void initState() {
    _onScrollBottom = (){
      if(_scrollController.hasClients && _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        widget.onScrollBottom();
      }
    };
    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(widget.pagination.isLast && widget.pagination.ids.isEmpty)
          const Expanded(
            child: NoQuestionAbstractItemsWidget()
          ),
        Expanded(
          child: GridView.builder(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: widget.questions.length,
            itemBuilder: (context,index) => QuestionAbstractItemWidget(
              key: ValueKey(widget.questions.elementAt(index)),
              question: widget.questions.elementAt(index),
              onTap: widget.onTap,
            )
          ),
        ),
        if(widget.pagination.loadingNext)
          const LoadingCircleWidget(strokeWidth: 3)
      ],
    );
  }
}