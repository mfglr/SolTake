import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'create_subject_page_constants.dart';

class CreateSubjectPage extends StatefulWidget {
  
  const CreateSubjectPage({super.key});

  @override
  State<CreateSubjectPage> createState() => _CreateSubjectPageState();
}

class _CreateSubjectPageState extends State<CreateSubjectPage> {
  String _key = "";
  final _formKey = GlobalKey<FormState>();

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: LanguageWidget(
                child: (language) => Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty) return requiredField[language]!;
                      if(value.length > 64) return maxLength[language]!;
                      return null;
                    },
                    maxLength: 64,
                    onChanged: (value) => _key = value,
                    decoration: InputDecoration(
                      hintText: hintText[language]!
                    ),
                  ),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  Navigator.of(context).pop(_key);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const FaIcon(
                      FontAwesomeIcons.book
                    ),
                  ),
                  LanguageWidget(
                    child: (langauge) => Text(
                      create[langauge]!
                    )
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}