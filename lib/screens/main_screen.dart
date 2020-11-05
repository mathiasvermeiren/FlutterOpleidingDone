import 'package:flutter/material.dart';
import 'package:flutter_course_haxx_app/pages/profile_page.dart';
import 'package:flutter_course_haxx_app/pages/sessions_page.dart';
import 'package:flutter_course_haxx_app/pages/sign_up_page.dart';
import 'package:flutter_course_haxx_app/pages/speakers_page.dart';

class MainScreen extends StatefulWidget {
  final int index;

  MainScreen(this.index);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentNavigationIndex;
  Widget currentPage;
  List<Widget> pages;
  SignUpPage signUpPage;
  SessionsPage sessionsPage;
  SpeakersPage speakersPage;

  @override
  void initState() {
    signUpPage = SignUpPage();
    sessionsPage = SessionsPage();
    speakersPage = SpeakersPage();

    pages = [sessionsPage, speakersPage, signUpPage];

    currentPage = pages[widget.index];
    currentNavigationIndex = widget.index;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Welcome to HAXX"),
            Text(
              " _",
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentNavigationIndex = index;
            currentPage = pages[index];
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentNavigationIndex,
        selectedItemColor: Theme.of(context).accentColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.tv), title: Text("Sessions")),
          BottomNavigationBarItem(
              icon: Icon(Icons.group), title: Text("Speakers")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Profile")),
        ],
      ),
      body: currentPage,
    );
  }
}
