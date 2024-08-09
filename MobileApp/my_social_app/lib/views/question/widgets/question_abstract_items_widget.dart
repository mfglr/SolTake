import 'package:flutter/material.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_item_widget.dart';

class QuestionAbstractItemsWidget extends StatefulWidget {
  final Iterable<QuestionState> questions;
  final Function onScrollBottom;
  const QuestionAbstractItemsWidget({
    super.key,
    required this.questions,
    required this.onScrollBottom
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
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: widget.questions.length,
      itemBuilder: (context,index) => QuestionAbstractItemWidget(question: widget.questions.elementAt(index),questionIndex: index)
    );
  }
}