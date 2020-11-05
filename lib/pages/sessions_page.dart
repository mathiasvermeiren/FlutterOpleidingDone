import 'package:flutter/material.dart';
import 'package:flutter_course_haxx_app/models/session.dart';
import 'package:flutter_course_haxx_app/services/sessions_service.dart';
import 'package:provider/provider.dart';

class SessionsPage extends StatefulWidget {
  @override
  _SessionsPageState createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  List<Session> _sessions;
  String _selectedTimeslot;

  @override
  Widget build(BuildContext context) {
    SessionsService _sessionsService = Provider.of<SessionsService>(context);
    return FutureBuilder(
        future: _sessionsService.fetchSessions(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          Widget widget;

          if (snapshot.connectionState == ConnectionState.done) {
            _sessions =
                _sessionsService.getSessions(timeSlot: _selectedTimeslot);
            widget = Column(
              children: [
                DropdownButton<String>(
                  value: _selectedTimeslot,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 5,
                  itemHeight: 50,
                  hint: Text('Timeslot'),
                  onChanged: (String newValue) {
                    setState(() {
                      _selectedTimeslot = newValue;
                    });
                  },
                  items: _sessionsService.timeSlots
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _sessions.length,
                    itemBuilder: (BuildContext listviewContext, int index) =>
                        Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.network(
                                _sessions[index].thumbnailUrl,
                                height: 70,
                                width: 70,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  "${_sessions[index].title}",
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 250,
                                  child: Text(_sessions[index].intro),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 150.0),
                                  child: ButtonTheme(
                                    height: 25,
                                    child: RaisedButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            '/sessiondetail',
                                            arguments: _sessions[index].key);
                                      },
                                      child: Text(
                                        '+ more info',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color:
                                                Theme.of(context).accentColor,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            widget = Center(child: CircularProgressIndicator());
          }
          return widget;
        });
  }
}
