import 'package:flutter/material.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_exam_requests_page/display_exam_requests_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'display_requestes_page_constants.dart';

class DisplayRequestsPage extends StatefulWidget {
  const DisplayRequestsPage({super.key});
  @override
  State<DisplayRequestsPage> createState() => _DisplayRequestsPageState();
}

class _DisplayRequestsPageState extends State<DisplayRequestsPage> {
  double _page = 0;
  final PageController _pageController = PageController();

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

  void _onPageChange() => setState(() { _page = _pageController.page ?? 0; });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) => AppTitle(
            title: title[language]!
          ),
        ),
      ),
      body: Column(
        children: [
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
              children: const [
                DisplayExamRequestsPage(),
                Text("test"),
                Text("test")
              ]
            ),
          )
        ],
      ),
    );
  }
}