import 'package:flutter_course_haxx_app/enums/competence.dart';

class Speaker {
  String firstName;
  String lastName;
  String competence;
  String intro;

  Speaker({this.firstName, this.lastName, this.competence, this.intro});

  Speaker.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        competence = json['competence'],
        intro = json['intro'];

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'competence': competence,
        'intro': intro,
      };
}
