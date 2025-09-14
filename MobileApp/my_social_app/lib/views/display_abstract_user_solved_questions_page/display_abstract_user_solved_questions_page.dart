import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/selectors.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/users_state/user_state.dart';
import 'package:my_social_app/packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/packages/entity_state/container_pagination.dart';
import 'package:my_social_app/views/display_abstract_user_solved_questions_page/display_abstract_solved_user_questions_page_constants.dart';
import 'package:my_social_app/views/question/pages/display_user_solved_questions_page/display_user_solved_questions_page.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract/question_container_abstracts_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class DisplayAbstractUserSolvedQuestionsPage extends StatefulWidget {
  final UserState user;
  const DisplayAbstractUserSolvedQuestionsPage({
    super.key,
    required this.user
  });

  @override
  State<DisplayAbstractUserSolvedQuestionsPage> createState() => _DisplayAbstractUserSolvedQuestionsPageState();
}

class _DisplayAbstractUserSolvedQuestionsPageState extends State<DisplayAbstractUserSolvedQuestionsPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => 
    onScrollBottom(
      _scrollController,
      (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        getNextEntitiesIfReady(
          store,
          selectUserSolvedQuestions(store, widget.user.id),
          NextUserSolvedQuestionsAction(userId: widget.user.id)
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
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ContainerPagination<int, QuestionState>>(
      onInit: (store) => 
        getNextEntitiesIfNoPage(
          store,
          selectUserSolvedQuestions(store, widget.user.id),
          NextUserSolvedQuestionsAction(userId: widget.user.id)
        ),
      converter: (store) => selectUserSolvedQuestions(store, widget.user.id),
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
            QuestionContainerAbstractsWidget(
              containers: pagination.containers,
              numberOfColumn: 2,
              onTap: (container) =>
                Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (context) => DisplayUserSolvedQuestionsPage(
                    user: widget.user,
                    firstDisplayedQuestionId: container.key,
                  ))),
            ),
          if(pagination.loadingNext)
            const LoadingCircleWidget()
        ],
      )
    );
  }
}