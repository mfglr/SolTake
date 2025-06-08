import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/not_published_questions/actions.dart';
import 'package:my_social_app/state/app_state/not_published_questions/selectors.dart';
import 'package:my_social_app/state/app_state/rejected_questions_state/actions.dart';
import 'package:my_social_app/state/app_state/rejected_questions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/helpers/start_creating_question.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/profile/pages/profile_page/profile_page_texts.dart';
import 'package:my_social_app/views/profile/pages/profile_page/widgets/profile_info_card_widget.dart';
import 'package:my_social_app/views/profile/pages/profile_page/widgets/profile_menu_button.dart';
import 'package:my_social_app/views/question/pages/display_not_published_questions_page/display_not_published_questions_page.dart';
import 'package:my_social_app/views/question/pages/display_rejected_questions_page/display_rejected_questions_page.dart';
import 'package:my_social_app/views/question/pages/display_user_questions_page.dart';
import 'package:my_social_app/views/question/pages/display_user_solved_questions_page.dart';
import 'package:my_social_app/views/question/pages/display_user_unsolved_questions_page.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_items_widget.dart';

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

  Widget _getNotPublishedQuestionsGrid(UserState user){
    return StoreConnector<AppState,Iterable<QuestionState>>(
      onInit: (store) => getNextPageIfNoPage(store,store.state.notPublishedQuestions,const NextNotPublishedQuestionsAction()),
      converter: (store) => selectNotPublishedQuestions(store),
      builder: (context, questions) => StoreConnector<AppState,Pagination>(
        converter: (store) => getNotPublishedQuestions(store),
        builder:(context,pagination) => QuestionAbstractItemsWidget(
          questions: questions,
          pagination: pagination,
          onTap: (questionId){
            Navigator
              .of(context)
              .push(
                MaterialPageRoute(builder: (context) => DisplayDraftQuestionsPage(
                  firstDisplayedQuestionId: questionId
                ))
              );
          },
          onScrollBottom: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(store, getNotPublishedQuestions(store), const NextNotPublishedQuestionsAction());
          },
        ),
      )
    );
  }

  Widget _getRejectedQuestionsGrid(UserState user){
    return StoreConnector<AppState,Iterable<QuestionState>>(
      onInit: (store) => getNextPageIfNoPage(store,store.state.rejectedQuestions,const NextRejectedQuestionsAction()),
      converter: (store) => selectRejectedQuestions(store),
      builder: (context, questions) => StoreConnector<AppState,Pagination>(
        converter: (store) => store.state.rejectedQuestions,
        builder:(context,pagination) => QuestionAbstractItemsWidget(
          questions: questions,
          pagination: pagination,
          onTap: (questionId){
            Navigator
              .of(context)
              .push(
                MaterialPageRoute(builder: (context) => DisplayRejectedQuestionsPage(
                  firstDisplayedQuestionId: questionId
                ))
              );
          },
          onScrollBottom: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(store, store.state.rejectedQuestions, const NextRejectedQuestionsAction());
          },
        ),
      )
    );
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
      onInit: (store) => getNextPageIfNoPage(store, user.unsolvedQuestions,NextUserUnsolvedQuestionsAction(userId: user.id)),
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
          getNextPageIfReady(store, user.unsolvedQuestions,NextUserUnsolvedQuestionsAction(userId: user.id));
        },
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserState?>(
      onInit: (store) => store.dispatch(LoadUserAction(userId: store.state.login.login!.id)),
      converter: (store) => store.state.userEntityState.getValue(store.state.login.login!.id),
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
                child: ProfileInfoCardWidget(user: user)
              ),
              LabelPaginationWidget(
                labelCount: icons.length,
                labelBuilder: (isActive,index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icons[index],
                      color: isActive ? Colors.black : Colors.grey,
                      size: 16,
                    ),
                    LanguageWidget(
                      child: (language) => Text(
                        getLabels(language).elementAt(index),
                        style: TextStyle(
                          color: isActive ? Colors.black : Colors.grey,
                          fontSize: 9
                        ),
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
                    _getNotPublishedQuestionsGrid(user),
                    _getRejectedQuestionsGrid(user),
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