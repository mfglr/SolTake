import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/question_user_likes_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_likes_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/question_user_likes_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/question/pages/display_question_likes_page/display_question_likes_page_constants.dart';
import 'package:my_social_app/views/question/widgets/question_user_like/question_user_likes_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class DisplayQuestionLikesPage extends StatefulWidget {
  final int questionId;
  const DisplayQuestionLikesPage({
    super.key,
    required this.questionId
  });

  @override
  State<DisplayQuestionLikesPage> createState() => _DisplayQuestionLikesPageState();
}

class _DisplayQuestionLikesPageState extends State<DisplayQuestionLikesPage> {
  final ScrollController _controller = ScrollController();
  
  void _onScrollBottom(){
    if(_controller.hasClients && _controller.position.pixels == _controller.position.maxScrollExtent){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(
        store,
        selectQuestionUserLikes(store, widget.questionId),
        NextQuestionUserLikesAction(questionId: widget.questionId)
      );
    }
  }

  @override
  void initState() {
    _controller.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context, listen: false);
        refreshEntities(
          store,
          selectQuestionUserLikes(store,widget.questionId),
          RefreshQuestionUserLikesAction(questionId: widget.questionId)
        );
        return onQuestionUserLikesLoaded(store, widget.questionId); 
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: AppTitle(
            title: title[getLanguage(context)]!
          ),
        ),
        body: StoreConnector<AppState, Pagination<int, QuestionUserLikeState>>(
            onInit: (store) => 
            getNextEntitiesIfNoPage(
              store,
              selectQuestionUserLikes(store, widget.questionId),
              NextQuestionUserLikesAction(questionId: widget.questionId)
            ),
          converter: (store) => selectQuestionUserLikes(store, widget.questionId),
          builder: (context, pagination) => SingleChildScrollView(
            controller: _controller,
            child: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height
              ),
              child: Column(
                children: [
                  if(pagination.isEmpty)
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            noLikes[getLanguage(context)]!,
                            textAlign: TextAlign.center,
                          )
                        ),
                      ],
                    )
                  else
                    QuestionUserLikesWidget(likes: pagination.values),
                  if(pagination.loadingNext)
                    const LoadingCircleWidget()
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}