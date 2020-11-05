import 'package:flutter/material.dart';

class ButtonHomePage extends StatelessWidget {
  final String route;
  final IconData buttonIcon;
  final String buttonText;

  ButtonHomePage({this.buttonIcon, this.buttonText, this.route});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(route);
      },
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 40,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(buttonIcon, color: Colors.white),
            SizedBox(width: 10),
            Text(
              this.buttonText,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
