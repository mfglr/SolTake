import 'dart:async';

class CustomTimer {
  late Duration _duration;
  late void Function(int tick) _callback;

  Timer? _timer;
  int _tick = 0;
  bool _isActive = false;

  CustomTimer(Duration duration, void Function(int tick) callback){
    _duration = duration;
    _callback = callback;


    _isActive = true;
    _timer = Timer.periodic(
      duration,
      (timer){
        _tick++;
        _callback(_tick);
      }
    );
  }

  void stop(){
    if(!_isActive) throw "Timer has been already stoped!";
    _timer!.cancel();
  }

  void start(){
    if(_isActive) throw "Timer has been already started!";
    _timer = Timer.periodic(
      _duration,
      (timer){
        _callback(_tick);
        _tick++;
      }
    );
  }

  void reset(){
    _tick = 0;
    _isActive = true;
    _timer?.cancel();
    _timer = Timer.periodic(
      _duration,
      (timer){
        _callback(_tick);
        _tick++;
      }
    );
  }


}