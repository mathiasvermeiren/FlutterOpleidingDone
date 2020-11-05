import 'dart:convert';

import 'package:flutter_course_haxx_app/models/speaker.dart';
import 'package:flutter_course_haxx_app/data/speakers_data.dart';
import 'package:http/http.dart' as http;

class SpeakersService {
  Future<List<Speaker>> getSpeakers() async {
    final http.Response response = await http
        .get("https://fluttercoursehaxx.firebaseio.com/speakers.json");

    Map<String, dynamic> fetchedData = json.decode(response.body);

    List<Speaker> speakers = [];
    fetchedData.forEach((String key, value) {
      Speaker speaker = Speaker.fromJson(value);
      speakers.add(speaker);
    });

    return speakers;
  }

  void populateFireBase() async {
    final Map<String, String> headers = {"Content-Type": "application/json"};
    var speakers = await speakersMock;
    for (Speaker speaker in speakers) {
      await http.post('https://fluttercoursehaxx.firebaseio.com/speakers.json',
          headers: headers, body: json.encode(speaker));
    }
  }
}
