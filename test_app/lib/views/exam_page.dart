import 'package:flutter/material.dart';
import 'package:test_app/state/app_state/app_state.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {

  @override
  void initState() {
    AppStateNotifier()
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: AppStateNotifier(),
        builder: (context,state,child) => Column(
          children: state.exams.values.map((e) => Text(e.name)).toList(),
        ) 
      ),
    );
  }
}