import 'dart:async';

class StoppableTimer {
  late Duration _duration;
  late void Function(int tick) _callback;

  late Timer _timer;
  int _tick = 0;
  bool isStopped = false;

  StoppableTimer(Duration duration, void Function(int tick) callback){
    _duration = duration;
    _callback = callback;

    isStopped = false;
    _setTimer();
  }

  void _setTimer() => _timer = Timer.periodic(_duration, (timer) => _callback(_tick++));

  void stop(){
    if(isStopped) throw "Timer has been already stoped!";
    isStopped = true;
    _timer.cancel();
  }

  void start(){
    if(!isStopped) throw "Timer has been already started!";
    isStopped = false;
    _setTimer();
  }

  void reset(){
    _tick = 0;
    isStopped = false;
    _timer.cancel();
    _setTimer();
  }

  void cancel() => _timer.cancel();
}