import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:badges/badges.dart' as badges;


class LikeButton extends StatefulWidget {
  final bool initialValue;
  final void Function(bool) onPressed;
  final bool isLoading;

  const LikeButton({
    super.key,
    required this.initialValue,
    required this.onPressed,
    required this.isLoading
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool _value;
  late final void Function() _onPressed;
  late final _subject = BehaviorSubject<bool>();
  late final StreamSubscription<bool> _comsumer;
  
  @override
  void initState() {
    _comsumer = _subject
      .stream
      .debounceTime(const Duration(milliseconds: 500))
      .distinct()
      .listen((value) => widget.onPressed(value));

    _onPressed = (){
      setState(() {
        _value = !_value; 
      });
      _subject.add(_value);
    };

    _value = widget.initialValue;
    super.initState();
  }

  @override
  void dispose() {
    _comsumer.cancel();
    super.dispose();
  }

  Icon _getIcon(bool value){
    return value ? const Icon(Icons.favorite,color: Colors.red) : const Icon(Icons.favorite_outline);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: !widget.isLoading ? _onPressed : (){},
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: 
        !widget.isLoading
          ? _getIcon(_value)
          : badges.Badge(
              badgeContent: const SizedBox(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(strokeWidth: 2,)
              ),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.transparent,
              ),
              child: _getIcon(_value),
            )
    );
  }
}