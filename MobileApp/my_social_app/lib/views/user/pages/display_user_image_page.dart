import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/image_status.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class DisplayUserImagePage extends StatefulWidget {
  final int userId;
  const DisplayUserImagePage({super.key,required this.userId});

  @override
  State<DisplayUserImagePage> createState() => _DisplayUserImagePageState();
}

class _DisplayUserImagePageState extends State<DisplayUserImagePage> {
  double _scale = 1;
  Offset _offset = Offset.zero;
  Offset _initial = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserImageState>(
      converter: (store) => store.state.userImageEntityState.entities[widget.userId]!,
      builder: (context,userImage) => Scaffold(
        backgroundColor: Colors.black,
        body: Builder(
          builder: (context){
            if(userImage.state != ImageStatus.done) return const LoadingCircleWidget();
            return Stack(
              children: [
                Center(
                  child: GestureDetector(
                    onScaleStart: (details){
                      setState(() {
                        _initial = details.focalPoint;
                      });
                    },
                    onScaleUpdate: (details){
                      setState(() {
                        _scale = details.scale;
                        _offset = details.focalPoint - _initial;
                      });
                    },
                    onScaleEnd: (details){
                      setState(() {
                        _scale = 1;
                        _offset = Offset.zero;
                      });
                    },
                    child: Transform.translate(
                      offset: _offset,
                      child: Transform.scale(
                        scale: _scale,
                        child: Image.memory(
                          userImage.image!,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ),
                Positioned(
                  top: 15,
                  right: 0,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon( 
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    )
                  )
                )
              ],
            );
          },
        )       
      ),
    );
  }
}