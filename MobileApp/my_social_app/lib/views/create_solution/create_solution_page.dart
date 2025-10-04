import 'package:flutter/material.dart';
import 'package:my_social_app/constants/solution.dart';
import 'package:my_social_app/custom_packages/media/models/local_media.dart';
import 'package:my_social_app/custom_packages/media/pages/select_directory_page/select_directory_page.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_slider/media_slider.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/create_solution/create_solution_page_consts.dart';
import 'package:my_social_app/views/create_solution/create_solution_button.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';

class CreateSolutionPage extends StatefulWidget {
  const CreateSolutionPage({
    super.key,
  });

  @override
  State<CreateSolutionPage> createState() => _CreateSolutionPageState();
}

class _CreateSolutionPageState extends State<CreateSolutionPage> {
  final TextEditingController _contentController = TextEditingController();
  final _focusNode = FocusNode();

  Iterable<LocalMedia> _medias = [];

  void _takeMedia() =>
    Navigator
      .of(context)
      .push<Iterable<LocalMedia>>(MaterialPageRoute(builder: (context) => const SelectDirectoryPage()))
      .then((medias) => setState(() => _medias = medias ?? _medias));

  void _createSolution(){
    if(_contentController.text.trim().isEmpty && _medias.isEmpty){
      throw emptyException[getLanguage(context)]!;
    }
    Navigator
      .of(context)
      .pop((
        content: _contentController.text.trim(),
        medias: _medias
      ));
  }

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
            onPressed: _createSolution,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(_medias.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.25,
                      child: MediaSlider(
                        medias: _medias,
                        blobService: AppClient.blobService,
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(4),
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
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: Text(
              addMediaButtonContent[getLanguage(context)]!
            )
          ),
          FloatingActionButton(
            onPressed: _takeMedia,
            shape: const CircleBorder(),
            child: const Icon(Icons.camera),
          ),
        ],
      ),
    );
  }
}