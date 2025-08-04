import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/new_questions_state/actions.dart';
import 'package:my_social_app/state/app_state/new_questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/views/display_abstract_user_solved_questions_page/display_abstract_solved_user_questions_page_constants.dart';
import 'package:my_social_app/views/question/pages/display_user_solved_questions_page/display_user_solved_questions_page.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_item_widget.dart';
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
        final pagination = selectUserSolvedQuestionPagination(store, widget.user.id);
        if(pagination.isReadyForNextPage){
          store.dispatch(NextUserSolvedQuestionsAction(userId: widget.user.id));
        }
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
    return StoreConnector<AppState,(KeyPagination<int>, Iterable<QuestionState>)>(
      onInit: (store){
        final pagination = selectUserSolvedQuestionPagination(store, widget.user.id);
        if(pagination.noPage){
          store.dispatch(NextUserSolvedQuestionsAction(userId: widget.user.id));
        }
      },
      converter: (store) => selectUserSolvedPaginationAndQuestions(store, widget.user.id),
      builder: (context, x) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(x.$1.isEmpty)
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
                itemCount: x.$2.length,
                itemBuilder: (context,index) => QuestionAbstractItemWidget(
                  key: ValueKey(x.$2.elementAt(index).id),
                  question: x.$2.elementAt(index),
                  onTap: (id) =>
                    Navigator
                      .of(context)
                      .push(MaterialPageRoute(builder: (context) => DisplayUserSolvedQuestionsPage(
                        user: widget.user,
                        firstDisplayedQuestionId: id,
                      ))),
                )
              ),
            ),
          if(x.$1.loadingNext)
            const LoadingCircleWidget()
        ],
      )
    );
  }
}