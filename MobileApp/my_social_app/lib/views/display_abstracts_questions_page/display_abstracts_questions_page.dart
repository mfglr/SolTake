import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/display_abstracts_questions_page/display_abstracts_questions_page_constants.dart';
import 'package:my_social_app/views/question/pages/display_user_questions_page.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_item_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class DisplayAbstractsQuestionsPage extends StatefulWidget {
  final int userId;
  const DisplayAbstractsQuestionsPage({
    super.key,
    required this.userId
  });

  @override
  State<DisplayAbstractsQuestionsPage> createState() => _DisplayAbstractsQuestionsPageState();
}

class _DisplayAbstractsQuestionsPageState extends State<DisplayAbstractsQuestionsPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => 
    onScrollBottom(
      _scrollController,
      (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        getNextEntitiesIfReady(
          store,
          selectUserQuestionsPagination(store, widget.userId),
          NextUserQuestionsAction(userId: widget.userId)
        );
      }
    );

  @override
  void initState() {
    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.addListener(_onScrollBottom);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,Pagination<int,Id<int>>>(
      onInit: (store) => getNextEntitiesIfNoPage(
        store,
        selectUserQuestionsPagination(store, widget.userId),
        NextUserQuestionsAction(userId: widget.userId)
      ),
      converter: (store) => selectUserQuestionsPagination(store, widget.userId),
      builder: (context, pagination) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(pagination.isEmpty)
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Text(
                noItems[getLanguage(context)]!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              )
            )
          else
            Expanded(
              child: StoreConnector<AppState, Iterable<QuestionState>>(
                converter: (store) => selectUserQuestions(store, widget.userId),
                builder: (context, questions) => GridView.builder(
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: questions.length,
                  itemBuilder: (context,index) => QuestionAbstractItemWidget(
                    key: ValueKey(questions.elementAt(index).id),
                    question: questions.elementAt(index),
                    onTap: (id) =>
                      Navigator
                        .of(context)
                        .push(MaterialPageRoute(builder: (context) => DisplayUserQuestionsPage(
                          userId: widget.userId,
                          firstDisplayedQuestionId: id,
                        ))),
                  )
                ),
              ),
            ),
          if(pagination.loadingNext)
            const LoadingCircleWidget()
        ],
      )
    );
  }
}