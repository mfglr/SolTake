import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/solution.dart';
import 'package:my_social_app/media/pages/select_directory_page/select_directory_page.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_content_page/add_solution_content_page_texts.dart';
import 'package:my_social_app/views/create_solution/widgets/create_solution_button/create_solution_button.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class AddSolutionContentPage extends StatefulWidget {
  const AddSolutionContentPage({
    super.key,
  });

  @override
  State<AddSolutionContentPage> createState() => _AddSolutionContentPageState();
}

class _AddSolutionContentPageState extends State<AddSolutionContentPage> {
  final TextEditingController _contentController = TextEditingController();
  final _focusNode = FocusNode();

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
        actions: [
          CreateSolutionButton(
            onPressed: () =>
              Navigator
                .of(context)
                .pop((content: _contentController.text.trim(),medias: const Iterable<AppFile>.empty())),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _contentController,
                focusNode: _focusNode,
                onTap: (){
                  if(_focusNode.hasFocus){
                    _focusNode.unfocus();
                  }
                },
                autocorrect: true,
                minLines: 10,
                maxLines: 10,
                maxLength: solutionContentMaxLength,
                decoration: InputDecoration(
                  hintText: texFieldContent[getLanguage(context)],
                  border: const OutlineInputBorder()
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () => 
                Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (context) => const SelectDirectoryPage()))
                  .then((medias){
                    if(medias == null) return;
                    if(context.mounted){
                      Navigator
                        .of(context)
                        .pop((content: _contentController.text.trim(), medias: medias));
                    }
                    
                  }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: LanguageWidget(
                      child: (language) => Text(
                        addMediaButtonContent[language]!
                      ),
                    ),
                  ),
                  const Icon(Icons.videocam),
                  const Icon(Icons.photo),
                  const Icon(Icons.spatial_audio_off),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}