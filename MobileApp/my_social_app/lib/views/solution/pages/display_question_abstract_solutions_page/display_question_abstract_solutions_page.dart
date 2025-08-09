import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/pages/display_correct_solutions_page.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/pages/display_incorrect_solutions_page.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/pages/display_pending_solutions_page.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/pages/display_solutions_page.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/widgets/create_solution_button.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/widgets/create_solution_by_ai_button.dart';
import 'display_question_abstract_solutions_page_constants.dart';

class DisplayQuestionAbstractSolutionsPage extends StatefulWidget {
  final int questionId;
  const DisplayQuestionAbstractSolutionsPage({
    super.key,
    required this.questionId
  });

  @override
  State<DisplayQuestionAbstractSolutionsPage> createState() => _DisplayQuestionAbstractSolutionsPageState();
}

class _DisplayQuestionAbstractSolutionsPageState extends State<DisplayQuestionAbstractSolutionsPage> {
  final PageController _pageController = PageController();
  late final void Function() _setPage;
  double _page = 0;

  @override
  void initState() {
    _setPage = (){
      setState(() {
        _page = _pageController.page ?? 0;
      });
    };
    _pageController.addListener(_setPage);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_setPage);
    _pageController.dispose();
    super.dispose();
  }

  Widget _labelBuilder(bool isActive, index){
    return Icon(
      icons[index],
      color: isActive ? Colors.black : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: Text(
          title[getLanguage(context)]!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      floatingActionButton:
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: CreateSolutionByAiButton(questionId: widget.questionId)
            ),
            CreateSolutionButton(questionId: widget.questionId),
          ],
        ),
      body: Column(
        children: [
          LabelPaginationWidget(
            labelBuilder: (isActive,index) => _labelBuilder(isActive,index),
            page: _page,
            labelCount: icons.length,
            width: MediaQuery.of(context).size.width,
            initialPage: 0,
            pageController: _pageController
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                DisplaySolutionsPage(questionId: widget.questionId),
                DisplayCorrectSolutionsPage(questionId: widget.questionId),
                DisplayPendingSolutionsPage(questionId: widget.questionId),
                DisplayIncorrectSolutionsPage(questionId: widget.questionId),
              ],
            ),
          )
        ],
      ),
    );
  }

  
}