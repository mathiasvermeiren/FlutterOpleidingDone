import 'package:flutter/material.dart';
import 'package:flutter_course_haxx_app/pages/sign_up_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/signIn');
    return Container(
      child: Center(child: Text("Profile")),
    );
  }
}
