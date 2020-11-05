import 'dart:convert';

import 'package:flutter_course_haxx_app/data/sessions_data.dart';
import 'package:flutter_course_haxx_app/models/session.dart';
import 'package:http/http.dart' as http;

class SessionsService {
  List<Session> sessions = [];
  List<String> timeSlots = [];

  Future<void> fetchSessions() async {
    sessions = [];
    timeSlots = [];
    final http.Response response = await http
        .get("https://fluttercoursehaxx.firebaseio.com/sessions.json");

    Map<String, dynamic> fetchedData = json.decode(response.body);
    fetchedData.forEach((String key, value) {
      Session session = Session.fromJson(value);
      session.key = key;
      sessions.add(session);

      if (!timeSlots.contains(session.timeSlot)) {
        timeSlots.add(session.timeSlot);
      }
    });

    timeSlots.sort();
    timeSlots.add('All');
  }

  List<Session> getSessions({String timeSlot}) {
    if (timeSlot == null || timeSlot == 'All') {
      return sessions;
    } else {
      return sessions.where((element) => element.timeSlot == timeSlot).toList();
    }
  }

  Future<Session> getSessionByKey(String itemKey) async {
    final http.Response response = await http
        .get("https://fluttercoursehaxx.firebaseio.com/sessions/$itemKey.json");

    Map<String, dynamic> fetchedData = json.decode(response.body);
    return Session.fromJson(fetchedData);
  }

  void populateFireBase() async {
    final Map<String, String> headers = {"Content-Type": "application/json"};
    var sessions = await sessionsMock;
    //var speakers = await this.getSpeakers();
    for (Session session in sessions) {
      await http.post('https://fluttercoursehaxx.firebaseio.com/sessions.json',
          headers: headers, body: json.encode(session));
    }
  }
}
