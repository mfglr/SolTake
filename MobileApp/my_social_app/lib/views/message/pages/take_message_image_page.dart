import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/app_state/create_message_state/actions.dart';
import 'package:my_social_app/state/app_state/store.dart';

class TakeMessageImagePage extends StatefulWidget {
  final CameraDescription camera;
  const TakeMessageImagePage({super.key,required this.camera});

  @override
  State<TakeMessageImagePage> createState() => _TakeMessageImagePageState();
}

class _TakeMessageImagePageState extends State<TakeMessageImagePage> {
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
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: CameraPreview(
                _controller,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Icon(
                              Icons.arrow_back,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
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
            store.dispatch(AddMessageImageAction(image: image));
            if (!context.mounted) return;
            if(store.state.createMessageState.images.length == 1){
              Navigator.of(context).popAndPushNamed(displayMessageImagesRoute);
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