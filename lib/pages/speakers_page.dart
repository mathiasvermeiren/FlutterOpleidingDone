import 'package:flutter/material.dart';
import 'package:flutter_course_haxx_app/models/speaker.dart';
import 'package:flutter_course_haxx_app/services/speakers_service.dart';
import 'package:provider/provider.dart';

class SpeakersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var speakersService = Provider.of<SpeakersService>(context);

    return FutureBuilder(
        future: speakersService.getSpeakers(),
        builder: (BuildContext context, AsyncSnapshot<List<Speaker>> snapshot) {
          Widget widget;

          if (snapshot.hasData) {
            widget = ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext listviewContext, int index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          'assets/images/haxx_logo.png',
                          height: 70,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data[index].firstName} ${snapshot.data[index].lastName}",
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          Text(snapshot.data[index].competence.toString()),
                          Container(
                            width: 250,
                            child: Text(snapshot.data[index].intro),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            widget = Center(child: CircularProgressIndicator());
          }

          return widget;
        });
  }
}
