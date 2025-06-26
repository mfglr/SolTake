import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/start_creating_question.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/display_abstract_solved_questions_page/display_abstract_solved_questions_page.dart';
import 'package:my_social_app/views/display_abstract_unsolved_questions_page/display_abstracts_unsolved_questions_page.dart';
import 'package:my_social_app/views/display_abstracts_questions_page/display_abstracts_questions_page.dart';
import 'package:my_social_app/views/profile/pages/profile_page/profile_page_texts.dart';
import 'package:my_social_app/views/profile/pages/profile_page/widgets/profile_info_card_widget.dart';
import 'package:my_social_app/views/profile/pages/profile_page/widgets/profile_menu_button.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';

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
                    DisplayAbstractsQuestionsPage(userId: user.id),
                    DisplayAbstractSolvedQuestionsPage(userId: user.id),
                    DisplayAbstractsUnsolvedQuestionsPage(userId: user.id)
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