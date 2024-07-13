import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/create_question_state/actions.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class TakePicturePage extends StatefulWidget {
  final CameraDescription camera;
  const TakePicturePage({super.key, required this.camera});
  
  @override
  State<TakePicturePage> createState() => _TakePicturePageState();
}

class _TakePicturePageState extends State<TakePicturePage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;


  @override
  void initState() {
    _controller = CameraController(widget.camera,ResolutionPreset.ultraHigh);
    _initializeControllerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          child: const Icon(Icons.photo_camera),
          onPressed: () async {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            store.dispatch(AddImageAction(image: image));
            if (!context.mounted) return;
            if(store.state.createQuestionState.images.length == 1){
              Navigator.of(context).pop();
              await Navigator.of(context).pushNamed(displayImagesRoute);
            }
            else{
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}