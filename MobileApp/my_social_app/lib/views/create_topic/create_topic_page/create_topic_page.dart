import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'create_topic_page_constants.dart';

class CreateTopicPage extends StatefulWidget {
  const CreateTopicPage({super.key});

  @override
  State<CreateTopicPage> createState() => _CreateTopicPageState();
}

class _CreateTopicPageState extends State<CreateTopicPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LanguageWidget(
          child: (langauge) => AppTitle(
            title: title[langauge]!
          )
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Form(
                key: _formKey,
                child: LanguageWidget(
                  child: (language) => TextFormField(
                    controller: _controller,
                    validator: (value){
                      if(value == null || value.isEmpty) return requiredField[language];
                      if(value.length < 3 || value.length > 256) return length[language];
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: hintText[language]
                    ),
                  ),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  Navigator.of(context).pop(_controller.text);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const Icon(Icons.create)
                  ),
                  LanguageWidget(
                    child: (language) => Text(
                      create[language]!
                    ),
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