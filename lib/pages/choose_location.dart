import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(
        url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png'),
    WorldTime(url: 'Asia/Kathmandu', location: 'Kathmandu', flag: 'nepal.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'korea.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'thailand.png'),
  ];

  void updateTime(index) async{
    WorldTime newInstance = locations[index];
    await newInstance.getTime();
    Navigator.pop(context,{
      'location': newInstance.location,
      'flag': newInstance.flag,
      'time': newInstance.time,
      'isDaytime': newInstance.isDaytime,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Location'),
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(
                    locations[index].location,
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
