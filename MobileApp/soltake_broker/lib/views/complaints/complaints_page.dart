import 'package:flutter/material.dart';
import 'package:soltake_broker/views/complaints/complaints_page_constants.dart';
import 'package:soltake_broker/views/complaints/pages/question_complaints_page/question_complaints_page.dart';
import 'package:soltake_broker/views/complaints/pages/solution_complaints_page.dart';
import 'package:soltake_broker/views/shared/app_title.dart';
import 'package:soltake_broker/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:soltake_broker/views/shared/language_widget.dart';

class ComplaintsPage extends StatefulWidget {
  const ComplaintsPage({super.key});

  @override
  State<ComplaintsPage> createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  double _page = 0;
  final PageController _pageController = PageController();

  void _onPageChange() => setState(() { _page = _pageController.page ?? 0; });

  @override
  void initState() {
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
        title: AppTitle(
          title: "Şikayetler"
        ),
      ),
      body: Column(
        children: [
          LabelPaginationWidget(
            labelCount: icons.length,
            labelBuilder: (isActive, index) => Column(
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
                QuestionComplaintsPage(),
                SolutionComplaintsPage()
              ],
            ),
          )
        ],
      ),
    );
  }
}