import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/question/widgets/question_user_like/question_user_likes_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/shared/loading_view.dart';

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
      final pagination = selectQuestionLikesPagination(store,widget.questionId);
      getNextEntitiesIfReady(store, pagination ,NextQuestionLikesAction(questionId: widget.questionId));
    }
  }

  @override
  void initState() {
    _controller.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,QuestionState?>(
      onInit: (store) => 
        getNextEntitiesIfNoPage(
          store,
          selectQuestionLikesPagination(store, widget.questionId),
          NextQuestionLikesAction(questionId: widget.questionId)
        ),
      converter: (store) => selectQuestion(store, widget.questionId),
      builder: (context,question) => question == null
        ? const LoadingView()
        : Scaffold(
            appBar: AppBar(
              leading: const AppBackButtonWidget(),
              title: AppTitle(
                title: AppLocalizations.of(context)!.display_question_likes_page_likes
              ),
            ),
            body: SingleChildScrollView(
              controller: _controller,
              child: QuestionUserLikesWidget(likes: question.likes.values),
            )
          ),
    );
  }
}