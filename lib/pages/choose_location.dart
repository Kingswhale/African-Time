import 'package:flutter/material.dart';
import 'package:african_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Abidjan', location: 'Abidjan', flag: 'abdj.gif',),
    WorldTime(url: 'Africa/Accra', location: 'Accra', flag: 'ghana.png'),
    WorldTime(url: 'Africa/Algiers', location: 'Algiers', flag: 'alg.png'),
    WorldTime(url: 'Africa/Bissau', location: 'Bissau', flag: 'bissau.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Casablanca', location: 'Casablanca', flag: 'mor.png'),
    WorldTime(url: 'Africa/Ceuta', location: 'Ceuta', flag: 'ceuta.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'za.png'),
    WorldTime(url: 'Africa/Juba', location: 'Juba', flag: 'kenya.png'),
    WorldTime(url: 'Africa/Khartoum', location: 'Khartoum', flag: 'sudan.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'ng.png'),
    WorldTime(url: 'Africa/Maputo', location: 'Maputo', flag: 'maputo.png'),
    WorldTime(url: 'Africa/Monrovia', location: 'Monrovia', flag: 'liberia.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'Africa/Ndjamena', location: 'Ndjamena', flag: 'chad.png'),
    WorldTime(url: 'Africa/Sao_Tome', location: 'Sao_Tome', flag: 'sao_tome.png'),
    WorldTime(url: 'Africa/Tripoli', location: 'Tripoli', flag: 'libya.png'),
    WorldTime(url: 'Africa/Tunis', location: 'Tunis', flag: 'tunisia.png'),
    WorldTime(url: 'Africa/Windhoek', location: 'Windhoek', flag: 'namibia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
