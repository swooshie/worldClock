import 'package:flutter/material.dart';
// ignore: implementation_imports
//import 'package:flutter_spinkit/src/rotating_circle.dart';
// ignore: implementation_imports
import 'package:flutter_spinkit/src/fading_cube.dart';
import 'package:worldtime/services/worldTime.dart';


class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag:'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0
        ),
      ),
    );
  }
}