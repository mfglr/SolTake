import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/display_abstract_solved_questions_page/display_abstract_solved_questions_page_constants.dart';
import 'package:my_social_app/views/question/pages/display_user_solved_questions_page.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_item_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class DisplayAbstractSolvedQuestionsPage extends StatefulWidget {
  final int userId;
  const DisplayAbstractSolvedQuestionsPage({
    super.key,
    required this.userId
  });

  @override
  State<DisplayAbstractSolvedQuestionsPage> createState() => _DisplayAbstractSolvedQuestionsPageState();
}

class _DisplayAbstractSolvedQuestionsPageState extends State<DisplayAbstractSolvedQuestionsPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => 
    onScrollBottom(
      _scrollController,
      (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        getNextEntitiesIfReady(
          store,
          selectUserSolvedQuestions(store, widget.userId),
          NextUserSolvedQuestionsAction(userId: widget.userId)
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
    return StoreConnector<AppState,Pagination<int, QuestionState>>(
      onInit: (store) => getNextEntitiesIfNoPage(
        store,
        selectUserSolvedQuestions(store, widget.userId),
        NextUserSolvedQuestionsAction(userId: widget.userId)
      ),
      converter: (store) => selectUserSolvedQuestions(store, widget.userId),
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
              child:  GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: pagination.values.length,
                itemBuilder: (context,index) => QuestionAbstractItemWidget(
                  key: ValueKey(pagination.values.elementAt(index).id),
                  question: pagination.values.elementAt(index),
                  onTap: (id) =>
                    Navigator
                      .of(context)
                      .push(MaterialPageRoute(builder: (context) => DisplayUserSolvedQuestionsPage(
                        userId: widget.userId,
                        firstDisplayedQuestionId: id,
                      ))),
                )
              ),
            ),
          if(pagination.loadingNext)
            const LoadingCircleWidget()
        ],
      )
    );
  }
}