import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_widget/media_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/not_found_widget.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/users_state/selectors.dart';
import 'package:my_social_app/state/users_state/user_state.dart';

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
    return StoreConnector<AppState,UserState>(
      converter: (store) => selectUserById(store, widget.userId).entity!,
      builder: (context,state) => Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
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
                    child: state.image != null
                      ? MediaWidget(
                          media: state.image!,
                          blobService: AppClient.blobService,

                        )
                      : const AspectRatio(
                          aspectRatio: 1,
                          child: NotFoundWidget()
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
        )     
      ),
    );
  }
}