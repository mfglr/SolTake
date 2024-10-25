import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/services/user_service.dart';

class UserImageWidget extends StatefulWidget {
  final int userId;
  final double diameter;
  final void Function()? onPressed;
  
  const UserImageWidget({
    super.key,
    required this.userId,
    required this.diameter,
    this.onPressed
  });

  @override
  State<UserImageWidget> createState() => _UserImageWidgetState();
}

class _UserImageWidgetState extends State<UserImageWidget> {
  Uint8List? _image;

  @override
  void initState() {
    UserService()
      .getUserImage(widget.userId)
      .then((file) => file.readAsBytes())
      .then((bytes) => setState(() => _image = bytes));
    super.initState();
  }

  Widget _generateImage(){
    return Container(
      width: widget.diameter,
      height: widget.diameter,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Builder(
        builder: (context) {
          if(_image == null) return Container(color: const Color.fromRGBO(226, 226, 226, 1));
          return Image.memory(
            _image!,
            width: widget.diameter,
            height: widget.diameter,
            fit: BoxFit.cover,
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    if(widget.onPressed == null) return _generateImage();
    return IconButton(
      onPressed: widget.onPressed,
      icon: _generateImage()
    );
  }
}

