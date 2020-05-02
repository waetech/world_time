import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location; //location name for the UI
  String time; //time in that location
  String flag; //url to asset flag icon
  String url; //location url for api end point

  WorldTime({ this.location, this.flag, this.url });

 Future<void> getTime() async {

   try {
     //Make request
     Response response = await get('http://worldtimeapi.org/api/timezone/$url');
     Map data = jsonDecode(response.body);
     //print(data);

     //get properties
     String datetime = data['datetime'];
     String offset = data['utc_offset'].substring(1, 3);
     String timezone = data['timezone'];
     //print(datetime);
     //print(offset);
     //print(datetime);
     //print(timezone);

     //create the date time object
     DateTime now = DateTime.parse(datetime);
     now = now.subtract(Duration(hours: 4));




     //set the time property
     time = DateFormat.jm().format(now);

   }

   catch (e) {
     print('caught error: $e');
     time = 'could not get time data';

   }


  }

}


