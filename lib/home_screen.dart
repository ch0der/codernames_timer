import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'timer_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TimerBloc>(context);
    return Scaffold(
      body: StreamBuilder<DateTime>(
        stream: bloc.time,
        builder: (context,AsyncSnapshot<DateTime> snapshot){
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }
          return Center(
            child: Text(createDigitalTime(snapshot.data!)),
          );
        },
      ),
    );
  }
}
String createDigitalTime(DateTime time) {
  return "${convertHours(time.hour).toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
}

int convertHours(int hour) {
  int h = hour > 12 ? hour - 12 : hour;

  return h == 0 ? 12 : h;
}
