import 'package:flutter/material.dart';
import 'package:soltake_broker/views/requests_page/pages/exam_requests_page/exam_requests_page.dart';
import 'package:soltake_broker/views/requests_page/pages/subject_requests_page/subject_requests_page.dart';
import 'package:soltake_broker/views/requests_page/requests_page_constants.dart';
import 'package:soltake_broker/views/shared/app_title.dart';
import 'package:soltake_broker/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:soltake_broker/views/shared/language_widget.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final _controller = PageController();
  double _page = 0;

  void _onPageChange() => setState(() { _page = _controller.page ?? 0; });

  @override
  void initState() {
    _controller.addListener(_onPageChange);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onPageChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(
          title: "Istekler"
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
              pageController: _controller
            ),
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                ExamRequestsPage(),
                SubjectRequestsPage(),
                Text("test")
              ]
            ),
          )
        ],
      ),
    );
  }
}