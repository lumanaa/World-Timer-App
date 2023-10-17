import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  late bool isDaytime ;
  WorldTime({required this.location,  required this.flag, required this.url});
  Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse(
          'http://worldtimeapi.org/api/timezone/$url'));
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        // print(data);
        // print(data['datetime']);
        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(0, 3);

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));
        
        isDaytime = now.hour > 6 && now.hour <15 ; 
        time = DateFormat.jm().format(now);
        print("now.hour: ${now.hour}, isDaytime: $isDaytime");
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      time = 'could not get data';
    }
  }
}
