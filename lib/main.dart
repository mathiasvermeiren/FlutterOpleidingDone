import 'package:flutter/material.dart';
import 'package:flutter_course_haxx_app/navigation/route_generator.dart';
import 'package:flutter_course_haxx_app/pages/landing_page.dart';
import 'package:flutter_course_haxx_app/pages/sessions_page.dart';
import 'package:flutter_course_haxx_app/screens/main_screen.dart';
import 'package:flutter_course_haxx_app/services/authentication_service.dart';
import 'package:flutter_course_haxx_app/services/sessions_service.dart';
import 'package:flutter_course_haxx_app/services/speakers_service.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(HaxxApp());
}

class HaxxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(create: (_) => AuthenticationService()),
        Provider<SessionsService>(create: (_) => SessionsService()),
        Provider<SpeakersService>(create: (_) => SpeakersService())
      ],
      child: MaterialApp(
        title: "Hello world",
        theme: ThemeData(
          primaryColor: HexColor("#5B6770"),
          primaryColorLight: HexColor("#D0D1D2"),
          primaryColorDark: HexColor("#515151"),
          accentColor: HexColor("#E9531D"),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
