import 'package:flutter/material.dart';
import 'package:flutter_course_haxx_app/models/session.dart';
import 'package:flutter_course_haxx_app/services/sessions_service.dart';
import 'package:provider/provider.dart';

class SessionDetailPage extends StatelessWidget {
  final String itemKey;

  SessionDetailPage({this.itemKey});

  @override
  Widget build(BuildContext context) {
    SessionsService _sessionsService = Provider.of<SessionsService>(context);
    return FutureBuilder(
      future: _sessionsService.getSessionByKey(itemKey),
      builder: (BuildContext context, AsyncSnapshot<Session> snapshot) {
        Widget widget;

        if (snapshot.hasData) {
          widget = Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).accentColor,
              title: Text(
                snapshot.data.title,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.network(
                    snapshot.data.imageUrl,
                    height: 150,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(snapshot.data.description),
                ],
              ),
            ),
          );
        } else {
          widget = Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).accentColor,
              title: Text(
                'Loading ...',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return widget;
      },
    );
  }
}
