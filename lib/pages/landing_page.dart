import 'package:flutter/material.dart';
import 'package:flutter_course_haxx_app/widgets/button_home_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/haxx_logo.png',
                  height: 250,
                ),
                ButtonHomePage(
                    buttonIcon: Icons.tv,
                    buttonText: "Sessions",
                    route: '/sessions'),
                ButtonHomePage(
                    buttonIcon: Icons.group,
                    buttonText: "Speakers",
                    route: '/speakers'),
                ButtonHomePage(
                    buttonIcon: Icons.person,
                    buttonText: "Profile",
                    route: '/signUp'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
