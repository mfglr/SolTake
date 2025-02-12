import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:multimedia_slider/widgets/multimedia_image_player.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/frame_catcher.dart';
import 'package:my_social_app/views/create_solution_by_ai/create_prompt_page/widgets/create_solution_button.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class CreatePromptPage extends StatefulWidget {
  final double position;
  final Multimedia media;

  const CreatePromptPage({
    super.key,
    required this.position,
    required this.media
  });

  @override
  State<CreatePromptPage> createState() => _CreatePromptPageState();
}

class _CreatePromptPageState extends State<CreatePromptPage> {
  late final TextEditingController _promptController;
  late final Future<Uint8List> _frame;

  @override
  void initState() {
    _promptController = TextEditingController();
    _promptController.text = "Resimdeki soruyu çözebilir misin?";

    if(widget.media.multimediaType == MultimediaType.video){
      _frame = FrameCatcherService()
        .catchFrame(widget.media.containerName, widget.media.blobName, widget.position);
    }

    super.initState();
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: const AppTitle(title: "Create Prompt"),
        actions: [
          CreateSolutionButton(prompt: _promptController.text)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Builder(builder: (context){
                if(widget.media.multimediaType == MultimediaType.image){
                  return MultimediaImagePlayer(
                    media: widget.media,
                    blobServiceUrl: AppClient.blobService,
                    notFoundImagePath: noMediaAssetPath,
                    noImagePath: noMediaAssetPath
                  );
                } 
                return FutureBuilder(
                  future: _frame,
                  builder: (context,state){
                    if(state.connectionState == ConnectionState.done){
                      return Image.memory(
                        state.data!,
                        fit: BoxFit.contain,
                      );
                    }
                    return const LoadingCircleWidget();
                  }
                );
              })
                
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: TextField(
                minLines: 10,
                maxLines: null,
                controller: _promptController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}