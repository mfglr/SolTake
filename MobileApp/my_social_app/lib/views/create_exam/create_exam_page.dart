import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/exam_requests_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'create_exam_page_constants.dart';

class CreateExamPage extends StatefulWidget {
  const CreateExamPage({super.key});

  @override
  State<CreateExamPage> createState() => _CreateExamPageState();
}

class _CreateExamPageState extends State<CreateExamPage> {
  String _name = "";
  String _initialism = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) => AppTitle(
            title: title[language]!
          ) 
        ),
      ),
      body: Form(
        key: _formKey,
        child: LanguageWidget(
          child: (language) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) => _initialism = value,
                  decoration: InputDecoration(
                    hintText: initialismHintText[language],
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty) return requiredMessages[language]!;
                    if(value.isEmpty || value.length > 50) return initiliasmLengthMessage[language]!;
                    return null;
                  },
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) => _name = value,
                  decoration: InputDecoration(
                    hintText: nameHintText[language],
                    border: const OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty) return requiredMessages[language]!;
                    if(value.length < 3 || value.length > 256) return nameLengthmessage[language]!;
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      final store = StoreProvider.of<AppState>(context,listen: false);
                      store.dispatch(CreateExamRequestAction(name: _name, initialism: _initialism));
                      Navigator.of(context).pop();
                      ToastCreator.displaySuccess(successMessage[language]!);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        create[language]!
                      ),
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