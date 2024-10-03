import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/question.dart';
import 'package:my_social_app/constants/solution.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/shared/app_title.dart';

class AddSolutionContentPage extends StatefulWidget {
  final Iterable<XFile> multiMedya;
  const AddSolutionContentPage({
    super.key,
    required this.multiMedya
  });

  @override
  State<AddSolutionContentPage> createState() => _AddSolutionContentPageState();
}

class _AddSolutionContentPageState extends State<AddSolutionContentPage> {
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(title: AppLocalizations.of(context)!.add_solution_content_page_title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _contentController,
          minLines: 10,
          maxLines: 10,
          maxLength: solutionContentMaxLength,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.add_solution_content_page_text_field,
            border: const OutlineInputBorder()
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: OutlinedButton(
          onPressed: (){
            final content = _contentController.text.trim();
            if((content == "") && widget.multiMedya.isEmpty){
              ToastCreator.displayError(AppLocalizations.of(context)!.add_solution_content_page_content_error);
              return;
            }
            if(content.length > questionContentMaxLenght){
              ToastCreator.displayError(AppLocalizations.of(context)!.add_solution_content_page_content_length_error);
              return;
            }
            Navigator.of(context).pop(content);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(AppLocalizations.of(context)!.add_solution_content_page_create_solution_button),
              ),
              const Icon(Icons.create)
            ],
          )
        ),
      ),
    );
  }
}