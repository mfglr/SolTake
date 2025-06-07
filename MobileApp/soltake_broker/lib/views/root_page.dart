import 'package:flutter/material.dart';
import 'package:soltake_broker/views/question/display_questions_page.dart';
import 'package:soltake_broker/views/solutions/display_solutions_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) => setState(() { currentPageIndex = index;}),
        selectedIndex: currentPageIndex,
        destinations: [
          const NavigationDestination(
            selectedIcon: Icon(Icons.question_mark),
            icon: Icon(Icons.question_mark_outlined),
            label: 'Sorular',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.create),
            icon: Icon(Icons.create_outlined),
            label: 'Çözümler',
          ),
        ],
      ),
      body: [
        const DisplayQuestionsPage(),
        const DisplaySolutionsPage()
      ][currentPageIndex]
    );
  }
}