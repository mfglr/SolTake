import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/views/display_abstract_user_unsolved_questions_page/display_abstracts_user_unsolved_questions_page_constants.dart';
import 'package:my_social_app/views/question/pages/display_user_unsolved_questions_page/display_user_unsolved_questions_page.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_item_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class DisplayAbstractsUserUnsolvedQuestionsPage extends StatefulWidget {
  final UserState user;
  const DisplayAbstractsUserUnsolvedQuestionsPage({
    super.key,
    required this.user
  });

  @override
  State<DisplayAbstractsUserUnsolvedQuestionsPage> createState() => _DisplayAbstractsUserUnsolvedQuestionsPageState();
}

class _DisplayAbstractsUserUnsolvedQuestionsPageState extends State<DisplayAbstractsUserUnsolvedQuestionsPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => 
    onScrollBottom(
      _scrollController,
      (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        final paginatin = selectUserUnsolvedQuestionPagination(store, widget.user.id);
        if(paginatin.isReadyForNextPage){
          store.dispatch(NextUserUnsolvedQuestionsAction(userId: widget.user.id));
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
        final paginatin = selectUserUnsolvedQuestionPagination(store, widget.user.id);
        if(paginatin.noPage){
          store.dispatch(NextUserUnsolvedQuestionsAction(userId: widget.user.id));
        }
      },
      converter: (store) => selectUserUnsolvedPaginationAndQuestions(store, widget.user.id),
      builder: (context, data) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(data.$1.isEmpty)
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
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: data.$2.length,
                itemBuilder: (context,index) => QuestionAbstractItemWidget(
                  key: ValueKey(data.$2.elementAt(index).id),
                  question: data.$2.elementAt(index),
                  onTap: (id) =>
                    Navigator
                      .of(context)
                      .push(MaterialPageRoute(builder: (context) => DisplayUserUnsolvedQuestionsPage(
                        user: widget.user,
                        firstDisplayedQuestionId: id,
                      ))),
                )
              ),
            ),
          if(data.$1.loadingNext)
            const LoadingCircleWidget()
        ],
      )
    );
  }
}