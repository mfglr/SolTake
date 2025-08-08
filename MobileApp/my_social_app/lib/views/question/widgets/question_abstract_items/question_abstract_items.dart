import 'package:flutter/material.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/no_questions_widget/no_questions_widget.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_item_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'question_abstract_items_constants.dart';

class QuestionAbstractItems extends StatefulWidget {
  final (KeyPagination<int>, Iterable<QuestionState>) data;
  final void Function() onScrollBottom;
  final void Function(int questionId) onTap;
  final String? noQuestionsContent;

  const QuestionAbstractItems({
    super.key,
    required this.data,
    required this.onScrollBottom,
    required this.onTap,
    this.noQuestionsContent
  });

  @override
  State<QuestionAbstractItems> createState() => _QuestionAbstractItemsState();
}

class _QuestionAbstractItemsState extends State<QuestionAbstractItems> {
  final ScrollController _scrollController = ScrollController();
  late final void Function() _onScrollBottom;
  

  @override
  void initState() {
    _onScrollBottom = () => onScrollBottom(_scrollController,widget.onScrollBottom);
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
        if(widget.data.$1.isEmpty)
          Expanded(
            child: NoQuestionsWidget(
              content: widget.noQuestionsContent ?? content[getLanguage(context)]!
            )
          )
        else
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: widget.data.$2.length,
              itemBuilder: (context,index) => QuestionAbstractItemWidget(
                key: ValueKey(widget.data.$2.elementAt(index)),
                question: widget.data.$2.elementAt(index),
                onTap: widget.onTap,
              )
            ),
          ),
        if(widget.data.$1.loadingNext)
          const LoadingCircleWidget(strokeWidth: 3)
      ],
    );
  }
}