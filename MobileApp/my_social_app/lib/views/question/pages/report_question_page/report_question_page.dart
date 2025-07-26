import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/views/question/pages/report_question_page/report_question_page_constants.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/question_item_popup_menu/question_item_popup_menu_constants.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class ReportQuestionPage extends StatefulWidget {
  final QuestionState question;
  const ReportQuestionPage({
    super.key,
    required this.question
  });

  @override
  State<ReportQuestionPage> createState() => _ReportQuestionPageState();
}

class _ReportQuestionPageState extends State<ReportQuestionPage> {
  final _formKey = GlobalKey<FormState>();
  int _reason = -1;
  String? _content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) => AppTitle(
            title: report[language]!
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<int>(
                value: 0,
                validator: (value){
                  if(value == 0) return reasonRequiredMessage[getLanguage(context)]!;
                  return null;
                },
                items: options
                  .mapIndexed(
                    (i,e) => DropdownMenuItem<int>(
                      value: i,
                      child: Text(
                        e[getLanguage(context)]!
                      ),
                    )
                  )
                  .toList(),
                onChanged: (value) => setState(() => _reason = (value ?? 0) - 1) 
              ),
              if(_reason == 4)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty) return contentRequiredMessage[getLanguage(context)]!;
                      if(value.length < 2 || value.length > 1024) return contentLengthMessage[getLanguage(context)]!;
                      return null;
                    },
                    onChanged: (value) => _content = value,
                    decoration: InputDecoration(
                      hintText: hintText[getLanguage(context)],
                      errorMaxLines: 4
                    ),
                  ),
                ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: OutlinedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      Navigator
                        .of(context)
                        .pop((reason: _reason, content: _content));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: const Icon(
                          Icons.send
                        )
                      ),
                      Text(
                        buttonContent[getLanguage(context)]!
                      )
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}