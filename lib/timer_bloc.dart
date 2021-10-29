import 'dart:async';
import 'package:rxdart/rxdart.dart';

class TimerBloc{
  TimerBloc(){
    updateTime();
  }

  Future<void> updateTime()async{
    setTime(DateTime.now());

    return Future.delayed(Duration(seconds: 1),updateTime);


  }
  Function(DateTime) get setTime => _clock.sink.add;
   Stream<DateTime> get time => _clock.stream;

   final _clock = BehaviorSubject<DateTime>();

   void dispose(){
     _clock.close();
   }
}