import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/views/display_abstract_user_solved_questions_page/display_abstract_user_solved_questions_page.dart';
import 'package:my_social_app/views/display_abstract_user_unsolved_questions_page/display_abstracts_user_unsolved_questions_page.dart';
import 'package:my_social_app/views/display_abstracts_user_questions_page/display_abstracts_user_questions_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_success_page/user_success_constants.dart';
import 'package:my_social_app/views/user/pages/user_page/widgets/user_popup_menu/user_popup_menu.dart';
import 'package:my_social_app/views/user/widgets/user_info_card_widget.dart';

class UserSuccessPage extends StatefulWidget {
  final UserState user;
  const UserSuccessPage({
    super.key,
    required this.user
  });

  @override
  State<UserSuccessPage> createState() => _UserSuccessPageState();
}

class _UserSuccessPageState extends State<UserSuccessPage> {
  final PageController _pageController = PageController();
  late final void Function() _onPageChange;
  double _page = 0;

  @override
  void initState() {
    _onPageChange = (){
      setState(() {
        _page = _pageController.page ?? 0;
      });
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
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(title: widget.user.userName),
        leading: const AppBackButtonWidget(),
        actions: [
          UserPopupMenu(userId: widget.user.id),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: UserInfoCardWidget(user: widget.user)
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
                  getLabels(getLanguage(context)).elementAt(index),
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
                DisplayAbstractsUserQuestionsPage(user: widget.user),
                DisplayAbstractUserSolvedQuestionsPage(user: widget.user),
                DisplayAbstractsUserUnsolvedQuestionsPage(user: widget.user)
              ]
            ),
          )
        ],
      )
    );
  }
}