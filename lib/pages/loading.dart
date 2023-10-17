import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Singapore', flag: 'Singapore.png', url: 'Asia/Singapore');
    await instance.getTime();
     Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1EFF6),
      body: SpinKitFadingCircle(color: Color.fromARGB(255, 240, 169, 200), ),
      
    );
  }
}
