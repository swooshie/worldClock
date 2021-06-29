import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try {
      String uri = "http://worldtimeapi.org/api/timezone/$url";
      Response response = await get(Uri.parse(uri));
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties from date time

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      String minuteOffset = data['utc_offset'].substring(4,6);
      //print(datetime);
      //print(offset);

      // create Datetime object

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(minuteOffset)));
      //print(now);
      

      // set time
      isDayTime = now.hour> 6 && now.hour < 20 ? true : false;

      this.time = DateFormat.jm().format(now);

      

    } catch(e) {

        print('caught error: $e');
        this.time = 'Could not get time data';

    }

    

  }

}

// WorldTime instance = WorldTime(location: 'Berlin', flag:'germany.png', url: 'Europe/Berlin');
// instance.getTime();