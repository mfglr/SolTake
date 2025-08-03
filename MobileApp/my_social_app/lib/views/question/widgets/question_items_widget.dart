import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/question/widgets/no_questions_widget/no_questions_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/question/widgets/question_item/question_item_widget.dart';

class QuestionItemsWidget extends StatefulWidget {
  final Pagination<int, QuestionState> pagination;
  final Function onScrollBottom;
  final int? firstDisplayedQuestionId;
  final String noQuestionContent;
  
  const QuestionItemsWidget({
    super.key,
    required this.pagination,
    required this.onScrollBottom,
    required this.noQuestionContent,
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
          if(widget.pagination.isEmpty)
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NoQuestionsWidget(content: widget.noQuestionContent)
                ]
              ),
            )
          else
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