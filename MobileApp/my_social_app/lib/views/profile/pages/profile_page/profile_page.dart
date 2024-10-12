import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/actionDispathcers.dart';
import 'package:my_social_app/helpers/start_creating_question.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/profile/pages/profile_page/widgets/profile_menu_button.dart';
import 'package:my_social_app/views/question/pages/display_user_questions_page.dart';
import 'package:my_social_app/views/question/pages/display_user_solved_questions_page.dart';
import 'package:my_social_app/views/question/pages/display_user_unsolved_questions_page.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_items_widget.dart';
import 'package:my_social_app/views/user/widgets/user_info_card_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final PageController _pageController = PageController();
  late final void Function() _onPageChange;
  late Iterable<String> labels;
  final icons = [Icons.question_mark,Icons.done,Icons.pending];
  double _page = 0;

  @override
  void initState() {
    _onPageChange = (){
      setState(() { _page = _pageController.page ?? 0; });
    };
    _pageController.addListener(_onPageChange);
  
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChange);
    _pageController.dispose();
    super.dispose();
  }

  Widget _getQuestionsGrid(UserState user){
    return StoreConnector<AppState,Iterable<QuestionState>>(
      onInit: (store) => getNextPageIfNoPage(store,user.questions,NextUserQuestionsAction(userId: user.id)),
      converter: (store) => store.state.selectUserQuestions(user.id),
      builder: (context, questions) => QuestionAbstractItemsWidget(
        questions: questions,
        pagination: user.questions,
        onTap: (questionId){
          Navigator
            .of(context)
            .push(
              MaterialPageRoute(builder: (context) => DisplayUserQuestionsPage(
                userId: user.id,
                firstDisplayedQuestionId: questionId
              ))
            );
        },
        onScrollBottom: (){
          final store = StoreProvider.of<AppState>(context,listen: false);
          getNextPageIfReady(store, user.questions, NextUserQuestionsAction(userId: user.id));
        },
      )
    );
  }

  Widget _getSolvedQuestionsGrid(UserState user){
    return StoreConnector<AppState,Iterable<QuestionState>>(
      onInit: (store) => getNextPageIfNoPage(store,user.solvedQuestions,NextUserSolvedQuestionsAction(userId: user.id)),
      converter: (store) => store.state.selectUserSolvedQuestions(user.id),
      builder: (context, questions) => QuestionAbstractItemsWidget(
        questions: questions,
        pagination: user.solvedQuestions,
        onTap: (questionId){
          Navigator
            .of(context)
            .push(
              MaterialPageRoute(builder: (context) => DisplayUserSolvedQuestionsPage(
                userId: user.id,
                firstDisplayedQuestionId: questionId
              ))
            );
        },
        onScrollBottom: (){
          final store = StoreProvider.of<AppState>(context,listen: false);
          getNextPageIfReady(store, user.solvedQuestions, NextUserSolvedQuestionsAction(userId: user.id));
        },
      )
    );
  }

  Widget _getUnsolvedQuestionsGrid(UserState user){
    return StoreConnector<AppState,Iterable<QuestionState>>(
      onInit: (store) => store.dispatch(GetNextPageUserUnsolvedQuestionsIfNoPageAction(userId: user.id)),
      converter: (store) => store.state.selectUserUnsolvedQuestions(user.id),
      builder: (context, questions) => QuestionAbstractItemsWidget(
        questions: questions,
        pagination: user.unsolvedQuestions,
        onTap: (questionId){
          Navigator
            .of(context)
            .push(
              MaterialPageRoute(builder: (context) => DisplayUserUnsolvedQuestionsPage(
                userId: user.id,
                firstDisplayedQuestionId: questionId
              ))
            );
        },
        onScrollBottom: (){
          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(GetNextPageUserUnsolvedQuestionsIfReadyAction(userId: user.id));
        },
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    labels = [
      AppLocalizations.of(context)!.user_page_label_all,
      AppLocalizations.of(context)!.user_page_label_solved,
      AppLocalizations.of(context)!.user_page_label_unsolved,
    ];
    return StoreConnector<AppState, UserState?>(
      onInit: (store) => store.dispatch(LoadUserAction(userId: store.state.accountState!.id)),
      converter: (store) => store.state.userEntityState.entities[store.state.accountState!.id],
      builder: (context, user){
        if(user == null) return const LoadingView();
        return Scaffold(
          appBar: AppBar(
            title: AppTitle(title: user.userName),
            actions: [
              IconButton(
                onPressed: () => startCreatingQuestion(context),
                icon: const Icon(Icons.question_mark),
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
                  minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              const ProfileMenuButton()
            ]
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: UserInfoCardWidget(user: user)
              ),
              LabelPaginationWidget(
                labelCount: 3,
                labelBuilder: (isActive,index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icons[index],
                      color: isActive ? Colors.black : Colors.grey,
                      size: 16,
                    ),
                    Text(
                      labels.elementAt(index),
                      style: TextStyle(
                        color: isActive ? Colors.black : Colors.grey,
                        fontSize: 13
                      ),
                    ),
                  ],
                ),
                page: _page,
                width: MediaQuery.of(context).size.width,
                initialPage: 0,
                pageController: _pageController
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    _getQuestionsGrid(user),
                    _getSolvedQuestionsGrid(user),
                    _getUnsolvedQuestionsGrid(user)
                  ]
                ),
              )
            ],
          )
        );
      }
    );
  }
}