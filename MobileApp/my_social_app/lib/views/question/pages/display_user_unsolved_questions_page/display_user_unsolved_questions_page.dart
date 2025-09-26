import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/selectors.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/users_state/user_state.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_containers_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_circle_widget.dart';

class DisplayUserUnsolvedQuestionsPage extends StatefulWidget {
  final UserState user;
  final int? firstDisplayedQuestionId;

  const DisplayUserUnsolvedQuestionsPage({
    super.key,
    required this.user,
    this.firstDisplayedQuestionId
  });

  @override
  State<DisplayUserUnsolvedQuestionsPage> createState() => _DisplayUserUnsolvedQuestionsPageState();
}

class _DisplayUserUnsolvedQuestionsPageState extends State<DisplayUserUnsolvedQuestionsPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context, listen: false);
      getNextEntitiesIfReady(
        store,
        selectUserUnsolvedQuestions(store, widget.user.id),
        NextUserUnsolvedQuestionsAction(userId: widget.user.id)
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
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(
          store,
          selectUserUnsolvedQuestions(store, widget.user.id),
          RefreshUserUnsolvedQuestionsAction(userId: widget.user.id)
        );
        return onUserUnsolvedQuestionsLoaded(store, widget.user.id);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: Text(
            "${widget.user.userName}${AppLocalizations.of(context)!.display_user_unsolved_questions_page_title}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: StoreConnector<AppState, ContainerPagination<int, QuestionState>>(
          onInit: (store) => getNextEntitiesIfNoPage(
            store,
            selectUserUnsolvedQuestions(store, widget.user.id),
            NextUserUnsolvedQuestionsAction(userId: widget.user.id)
          ),
          converter: (store) => selectUserUnsolvedQuestions(store, widget.user.id),
          builder: (context, pagination) => SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                QuestionContinersWidget(
                  containers: pagination.containers,
                  firstDisplayedQuestionId: widget.firstDisplayedQuestionId,
                ),
                if(pagination.loadingNext)
                  const LoadingCircleWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}