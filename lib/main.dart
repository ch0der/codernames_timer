import 'package:codernames_timer/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'library.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => CodenamerApp(),
        '/home':(context)=> HomeScreen(),
      },
    ),
  );

}

class CodenamerApp extends StatefulWidget {
  const CodenamerApp({Key? key}) : super(key: key);

  @override
  _CodenamerAppState createState() => _CodenamerAppState();
}

class _CodenamerAppState extends State<CodenamerApp> {
  @override
  Widget build(BuildContext context) {
    return Provider<TimerBloc>(create: (context) => TimerBloc(),
      dispose: (context,bloc) => bloc.dispose(),
      child: HomeScreen(),
    );
  }
}
