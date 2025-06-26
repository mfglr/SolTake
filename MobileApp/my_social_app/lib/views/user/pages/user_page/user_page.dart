import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/display_abstract_solved_questions_page/display_abstract_solved_questions_page.dart';
import 'package:my_social_app/views/display_abstract_unsolved_questions_page/display_abstracts_unsolved_questions_page.dart';
import 'package:my_social_app/views/display_abstracts_questions_page/display_abstracts_questions_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/user/pages/user_page/widgets/user_popup_menu/user_popup_menu.dart';
import 'package:my_social_app/views/user/widgets/user_info_card_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserPage extends StatefulWidget {
  final int? userId;
  final String? userName;

  const UserPage({
    super.key,
    this.userId,
    this.userName
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final PageController _pageController = PageController();
  late final void Function() _onPageChange;
  late Iterable<String> labels;
  final icons = [Icons.question_mark,Icons.done,Icons.pending];
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
    labels = [
      AppLocalizations.of(context)!.user_page_label_all,
      AppLocalizations.of(context)!.user_page_label_solved,
      AppLocalizations.of(context)!.user_page_label_unsolved,
    ];
    return StoreConnector<AppState, UserState?>(
      onInit: (store){
        if(widget.userId != null){
          store.dispatch(LoadUserAction(userId: widget.userId!));
        }
        if(widget.userName != null){
          store.dispatch(LoadUserByUserNameAction(userName: widget.userName!));
        }
      },
      converter: (store){
        if(widget.userId != null){
          return store.state.userEntityState.getValue(widget.userId!);
        }
        return store.state.userEntityState.getList((e) => e.userName == widget.userName).firstOrNull;
      },
      builder: (context, user){
        if(user == null) return const LoadingView();
        return Scaffold(
          appBar: AppBar(
            title: AppTitle(title: user.userName),
            leading: const AppBackButtonWidget(),
            actions: [
              UserPopupMenu(userId: user.id),
            ],
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