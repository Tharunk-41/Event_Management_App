import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../redux/store.dart';
import '../input/input.dart';
import '../input/remove.dart';
import '../profile/profile.dart';

class Landing extends StatefulWidget {
  static const routeName = '/';
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  late BuildContext appStateContext;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        appStateContext = context;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: Text('To Do App'),
          ),
          backgroundColor: Color(0xFFA0D6FF),
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  SizedBox(
                    child: Text(
                      'Upcoming Events',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.brown,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ...state.students!
                      .map(
                        //...students.map(
                        (e) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(
                                  y: e.y,
                                  m: e.m,
                                  h: e.h,
                                  n: e.n,
                                  d: e.d,
                                  i: e.i,
                                  name: e.name,
                                  srn: e.srn,
                                  phoneNo: e.phoneNo,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            trailing: FaIcon(
                              FontAwesomeIcons.circleArrowRight,
                            ),
                            title: Text(e.name),
                            subtitle: Text(e.srn),
                            leading: FaIcon(
                              FontAwesomeIcons.calendarCheck,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Input.routeName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.squarePlus,
                      ),
                      Text('Add Event'),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Remove.routeName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.trash,
                      ),
                      Text('Remove Event'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
