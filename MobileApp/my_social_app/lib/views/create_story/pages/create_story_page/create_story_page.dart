import 'package:app_file/app_file.dart';
import 'package:app_file_slider/app_file_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/create_story/pages/create_story_page/create_story_page_texts.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class CreateStoryPage extends StatefulWidget {
  final Iterable<AppFile> appFiles;

  const CreateStoryPage({
    super.key,
    required this.appFiles,
  });

  @override
  State<CreateStoryPage> createState() => _CreateStoryPageState();
}

class _CreateStoryPageState extends State<CreateStoryPage> {
  late Iterable<AppFile> _appfiles;

  @override
  void initState() {
    _appfiles = widget.appFiles;
    super.initState();
  }

  void _removeMedia(AppFile appfile){
    setState(() => _appfiles = _appfiles.where((e) => e != appfile));
    if(_appfiles.isEmpty){
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppFileSlider(
        medias: _appfiles,
        onRemoved: _removeMedia
      ),
      floatingActionButton: FilledButton(
        onPressed: (){
          final store = StoreProvider.of<AppState>(context,listen: false);
          
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: LanguageWidget(
                child: (langauge) => Text(
                  createStory[langauge]!,
                ),
              ),
            ),
            const Icon(Icons.add)
          ],
        )
      ),
    );
  }
}