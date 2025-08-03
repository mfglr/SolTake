import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/views/question/widgets/no_questions_widget/no_questions_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/question/widgets/question_item/question_item_widget.dart';

class QuestionItems extends StatefulWidget {
  final (KeyPagination<int>, Iterable<QuestionState>) data;
  final Function onScrollBottom;
  final int? firstDisplayedQuestionId;
  final String noQuestionContent;
  
  const QuestionItems({
    super.key,
    required this.data,
    required this.onScrollBottom,
    required this.noQuestionContent,
    this.firstDisplayedQuestionId,
  });

  @override
  State<QuestionItems> createState() => _QuestionItemsState();
}

class _QuestionItemsState extends State<QuestionItems> {
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
          if(widget.data.$1.isEmpty)
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
              widget.data.$2.length,
              (index) => Container(
                key: widget.data.$2.elementAt(index).id == widget.firstDisplayedQuestionId ? _key : null,
                margin: const EdgeInsets.only(bottom: 16),
                child: QuestionItemWidget(question: widget.data.$2.elementAt(index))
              ),
            ),
          if(widget.data.$1.loadingNext)
            const LoadingCircleWidget(strokeWidth: 3)
        ]
      ),
    );
  }
}