import 'package:flutter/material.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';

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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context){
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
                      child: UserImageWidget(
                        userId: widget.userId,
                        diameter: MediaQuery.of(context).size.width,
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
    );
  }
}