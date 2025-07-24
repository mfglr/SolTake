import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/question/widgets/question_item/question_item_widget.dart';

class QuestionItemsWidget extends StatefulWidget {
  final Pagination<int, QuestionState> pagination;
  final Function onScrollBottom;
  final num? firstDisplayedQuestionId;

  
  const QuestionItemsWidget({
    super.key,
    required this.pagination,
    required this.onScrollBottom,
    this.firstDisplayedQuestionId,
  });

  @override
  State<QuestionItemsWidget> createState() => _QuestionItemsWidgetState();
}

class _QuestionItemsWidgetState extends State<QuestionItemsWidget> {
  final ScrollController _scrollController = ScrollController();
  late final void Function() _onScrollBottom;
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    _onScrollBottom = (){
      if(_scrollController.hasClients && _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        widget.onScrollBottom();
      }
    };
    _scrollController.addListener(_onScrollBottom);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(_key.currentContext != null){
        Scrollable.ensureVisible(_key.currentContext!);
      }
    });

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
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          ...List.generate(
            widget.pagination.values.length,
            (index) => Container(
              key: widget.pagination.values.elementAt(index).id == widget.firstDisplayedQuestionId ? _key : null,
              margin: const EdgeInsets.only(bottom: 16),
              child: QuestionItemWidget(question: widget.pagination.values.elementAt(index))
            ),
          ),
          if(widget.pagination.loadingNext)
            const LoadingCircleWidget(strokeWidth: 3)
        ]
      ),
    );
  }
}